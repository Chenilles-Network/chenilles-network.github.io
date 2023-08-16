Chenilles Roadmap:
________________
Scalable, Interoperable and Programmable State Channel Network
A project by Mutual Knowledge Systems, May 2023
https://bit.ly/ChenillesRoadmap2023
TODO:
* Rewrite everything below!
* Merge with the Filecoin version at https://github.com/filecoin-project/devgrants/issues/1449






We design and propose to implement a variant of State Channels for Laconic that will not only (a) enable scalable off-chain payments on a “Layer 2”, but also (b) allow for many simultaneous on-going conditional payments on a “Layer 3”.
Furthermore, in the future, the very same State Channels can also (c) enable atomic payments between users mediated by the Network, (d) partake in a wider “Ethereum Lightning Network” of State Channels, and even (e) interoperate with the Bitcoin Lightning Network itself. Finally, (f) enable the safe, fast, and private deployment of arbitrary “closed” contracts between a user and the Network, and in particular (g) enforce the rules that members of the Network must follow, and at some point later (h) enable arbitrary contracts between multiple users as mediated by the Network.
For the initial version of the Laconic Network, we will only fully implement and productize features (a) and (b), but we will have enough provisions in the contract to implement the subsequent features by upgrading client code without having to upgrade the contract itself.


Introduction        2
Scaling Transactions without Extra Trust Assumptions        2
Connecting Laconic and other State Channel Network        2
Generalized State Channels        3
Plan Summary        4
Underlying Concepts        4
State Channels        4
Nested State Channels        5
Lightning Network        5
Payment Routing        6
Interoperation Between Blockchains        7
Open vs Closed Interactions        7
Closed Interactions over Generalized State Channels        8
Channels with More Than Two Participants        9
Off-Chain Code        10
Action Plan        10
Step 1: Simple State Channels        10
Step 2: Nested State Channels        10
Step 3: Payments with Intermediary        11
Step 4: Productizing the Network        11
Project Summary        11
Future Work        11
Audit        12
Maintenance        12
Productization of a Decentralized Layer 2  Network        12
Contracts on top of State Channels        13
Bibliography        13
Introduction
Scaling Transactions without Extra Trust Assumptions
State Channels were invented in 2015 by Joseph Poon and Thaddeus Dryja as the basic block of the Bitcoin Lightning Network, enabling fast, affordable and private micropayments as a layer 2 on top of Bitcoin’s layer 1, when the layer 1 (posting transactions directly on the blockchain) may be simpler and safer but slow, expensive and public. Remarkably, for a payment to be confirmed using a state channel does not require any trust assumption beside (a) trusting the underlying Blockchain, and (b) trusting one’s own computing infrastructure, both of which are already prerequisites for exchanging digital assets on that Blockchain.


In the first version of Laconic, we will implement State Channels by following the same principles as for the Bitcoin Lightning Network.
1. We will demonstrate micropayments between a user and the Network on a single “Layer 1 to 2” State Channel (L12). 
2. We will support conditional payments through an HTLC, allowing for trustless atomic transactions from user to user, with the Network as an untrusted technical intermediary.
3. We will demonstrate multiple nested “Layer 2 to 3” State Channels (L23) inside a single L12 State Channel, allowing for many independent transactions at the same time.


At that point, we will have a simple yet robust hub-and-spoke payment network with the Network as the hub.
Connecting Laconic and other State Channel Network
In a future version of Laconic, the payment network we are creating can interoperate with other State Channel Networks, by using compatible HTLC conditions:
* On Ethereum, Kchannels, the Raiden Network, Connext, Perun, Celer,  StateChannels.org, etc.
* On Bitcoin, the Bitcoin Lightning Network itself.
* On Cosmos, some state channel system using IBC.
* Any State Channel Network on any Blockchain with suitable HTLC contracts.


We would start by picking whichever are the easiest and the most popular State Channel Networks that we can work with, and demonstrate interoperability, then productize the result.


A complete implementation of a Mother-of-All State Channel Network capable of interoperating with all the above will probably be its own project separate from Laconic as such—though it could use Laconic as a springboard to launch better and faster. Such a Network will involve an Ethereum variant of each of the 11 steps of the Bitcoin Lightning BOLT specifications, plus additional steps and further generalizations so as to accommodate seamless interoperation between State Channel networks.


We will not do any of that in the first version of our State Channels, but we will keep our desire for compatibility somewhat in mind when designing this initial version.
Generalized State Channels
On Ethereum and other smart-contract capable blockchains (which does not include Bitcoin), State Channels can be used not merely for payments, but also for arbitrary conditional interactions between participants—be it a futures contract, an auction, a poker game, etc. State Channels with such functionality are called “Generalized State Channels”.


It is quite easy on Ethereum and similar blockchains to modify the basic State Channel infrastructure to accept Generalized State Channels—and much cheaper to add this functionality earlier than later. Thus we propose that the State Channel we implement for Laconic should indeed be Generalized State Channels from the get go.


However, it is quite difficult to offer a programming environment that makes it safe and affordable to develop contracts on top of state channels: indeed, contracts must then be written in multiple versions in different languages, such that one version does the off-chain computation and signing of updates on layer 2, but another version does the on-chain verification and enforcement on layer 1—and the two have to match perfectly, or else one or both participants may lose their assets.


We will start by only offering a simple hand-written demonstration of one simple contract on top of our infrastructure, to illustrate an application that is possible with (Generalized) State Channels on Laconic, but impossible on Bitcoin. Later on, we will develop a complete, safe and affordable programming environment for contracts on top of our Generalized State Channel infrastructure.


None of this support will be developed as part of the first version of Laconic. However, it makes sense to develop this functionality in a future version of Laconic—if only so that users can get better guarantees regarding the behavior of providers and/or members. This support would also come naturally as a feature of a Mother-of-All State Channel Network that extends further than Laconic itself, to connect with other State Channels on Ethereum and beyond.
Plan Summary
We understand that Laconic is foremost interested in launching its platform, and that time is of the essence: the first version should be working in the next few months. Therefore, we propose to implement the smallest necessary subset of the features:


We thus propose to implement for the Laconic Network:
1. Simple State Channels: As part of the Laconic contract’s “Vault”, functionality that implements state channels, together with a client that can use them for fast payment between two participants—enabling micropayments.
2. Nested State Channels: Multiple L23 State Channels inside a single L12 State Channel.
3. Payments with one intermediary: simple payments between two participants with the Network as a single intermediary, and routing payments between many participants using a hub-and-spoke network.


Each of these features will be demonstrated, then productized.


See below the section on Future Work for further features we propose to build for State Channels on Laconic.
Underlying Concepts
State Channels
A State Channel works as follows:
* Two participants put digital assets in a common contract that enforces the rules below.
* The two participants prepare and both sign “state updates” about how who would own how much of these assets should the channel be closed (the initial state is based on how much assets each participant contributed.)
* The two participants do not post these state updates on the blockchain, but rather keep them in private, until one or both of them wants to close the channel, or rebalance it (add or remove assets from it).
* Instead, when one participant wants to close or rebalance the channel, they both sign a settlement transaction, based on the latest state update, that enacts it.
* If the other participant refuses to cooperate in creating this settlement, or is unable to, the active participant who wants to settle may issue a claim based on the latest mutually signed state update, and challenge the other participant to disprove that claim.
* If the claim goes unchallenged, then after a timeout, the claimant can take his tokens as per the claimed state update. (Timeouts are one week on the Lightning Network.)
* As a response to the claim, the other participant may cooperate and sign a settlement that overrides the challenge, or may post his own more recent state update that overrides the previous one.


Thus, as long as your computer can watch the blockchain for a possible adversarial claim with an old unfavorable state update and successfully challenge it on time, you can be sure that you control any assets assigned to you in the latest state update. There are even “watchtower” services that for a small fee will watch the blockchain for you and make sure no claim based on such a disfavorable old state update will go unchallenged.


Since a state update only requires two signatures in private, it can be extremely fast, and doesn’t require the payment of expensive fees from the Blockchain. The two participants may even trade in very small amounts below what is affordable to transact directly on the blockchain, and may even maintain private accounting in fractions of such amounts, as long as they can agree on a rounding for the amounts appearing in the state updates.


In the first version of Laconic, we will fully implement State Channels, but only with the Network as one of the two participants. We will ensure these State Channels can be used in production. We will not implement mercenary watchtowers for the first version, but will implement it before V2.
Nested State Channels
State Channel that only supports one interaction at once is limited in what it can accomplish. When the only interactions are one-way payments that are very fast, as in the Bitcoin Lightning Network, this might be good enough. But when using Generalized State Channels, or even things as simple as swaps, or when handling a lot of simultaneous incomplete transactions, it becomes necessary for a channel to support multiple interactions at the same time. For that purpose, a simple solution is for State Channels to have built in support for nested State Channels. One channel may therefore contain multiple sub-channels. In an adversarial claim, each of them could be one of the outputs of the settlement or state update, at least if some kind of UTXO model is used for such adversarial outputs. In an account-based system, either the same behavior could apply with new accounts created for each sub-channel as the result of an unchallenged claim, or the claims could be recursively handled with a small gas overhead at each level of nesting.


In the first version of Laconic, we will fully implement support for Nested State Channels in our on-chain contracts.
Lightning Network
Given a network of State Channels, where each participant has one or more channels open with as many other participants, it becomes possible for one participant in the network to send tokens to another participant through intermediaries. For instance, participant A sends 5 tokens to participant B, who sends 5 tokens to participant C, etc., until participant Z receives 5 tokens from participant Y. As long as tokens are fungible and there is a “route” of channels from A to Z each with sufficient liquidity to cover the 5 tokens, then a transfer is possible. Very fast and cheap, private transactions become possible between all participants over amounts as small or as big as they are willing to handle.


For extra security, each intermediate transaction along the route can be made conditional on some triggering event, such that either all transfers happen, or none of them do. Bitcoin uses a “HTLC” for that (Hash Time-Lock Contract): the parties commit to a hash and a deadline, such that if the preimage to the hash is revealed before the deadline, the transfers happen, but if it isn’t, the transfer is canceled. Once all intermediaries along the way have signed their respective commitments, the preimage is revealed. To avoid attacks that lead to some participants losing due to a partial transfer, it is important for parties to sign in the correct order, for the deadlines of the respective commitments to be properly staggered, for these deadlines to interact well with the deadlines for the regular challenge mechanism, etc.


The main risk with State Channels is that some participant along a route you’re partaking in stops cooperating mid-transaction, and you and all the other participants have to pay fees to make a claim to close their channels and reopen new ones, their funds being blocked until timeout (for a week), the associated liquidity thus made unavailable. This risk increases as the routes get longer and involve participants who aren’t vetted for their good behavior. To offset this risk and to compensate them for making their liquidity available, reputable intermediaries will charge small fees to the participants who use the network.


In the first version of Laconic, we will implement HTLC support and demonstrate transfer with the Network as a single intermediary. We will not implement general support for transfer with many intermediaries, which is not conceptually harder but is more work than necessary for our value demonstration purposes.
Payment Routing
The proper use of HTLC allows for safe payment across a circuit with well-identified cooperating participants each possessing suitable assets in their respective State Channels. But how is this circuit to be established to begin with? Given a map of the Lightning Network as a graph, where each participant (who may control multiple addresses) is a node that may be more or less expected to successfully do its job, where each State Channel is an arc joining two nodes, where the current state of each State Channel describes the capacity of the arc in each direction, and each direction of each arc has a documented fee structure, well-known algorithms can find an optimal circuit or set of circuits to transfer a given amount from point A to point B while minimizing fees, maximizing expectation of success, or any given performance metric. Now, how is this map to be obtained, to begin with? Some service discovery mechanism is required. Then there are questions regarding how to keep this map up-to-date, how to avoid bad actors from poisoning the dataset, or from spying on the participants, how to maintain privacy with a routing algorithm that requires less of a map or one that reveals less data, etc.


The Bitcoin Lightning Network has answers to all these questions. These answers could probably be largely reused for an Ethereum Lightning Network, with some small adaptations. But to demonstrate as much value as possible with as little upfront investment as possible, we can restrict ourselves to a solution that works in the simplest of cases: payment through a single centralized intermediary. The sender and recipient can simply tell each other which of many intermediaries they support, in decreasing order of preference, until they find a suitable one; then they initiate a payment using this single intermediary. A network where every participant is connected to the same intermediary is called a “hub and spokes” network in reference to a bicycle wheel.


In the first version of Laconic, we will only implement routing in a very simple hub-and-spokes network with a single centralized intermediary. We will implement neither decentralized discovery of a network nor general routing in an arbitrary network: they are neither conceptually novel nor specific to Nervos, and are thus unnecessary for our value demonstration purposes.


Interoperation Between Blockchains
It is possible for State Channel Networks to interoperate with other State Channel Networks on other blockchains. For instance, participant A could send 1 BTC to participant B using a State Channel on Bitcoin, and B could then send 16 ETH to participant C on Ethereum, or whatever amount corresponds to the mutually agreed upon exchange rate. A and C would presumably pay a fee to B for providing the liquidity, but would otherwise be able to each use their preferred token on their preferred network as part of a same transaction with mutually agreeable amounts. Longer routes are possible across multiple blockchains, but in practice, participants will usually want to minimize the number of expensive currency exchanges along the route.


For interoperability, we will implement on top of Laconic State Channels a HTLC compatible with that of the Bitcoin Lightning Network: the hash function will be the same, the same deadline policy will be used, etc. Then, we will write a program that can simultaneously and coherently drive State Channels on both Laconic and Bitcoin, thus achieving transfers across blockchains. We will then demonstrate HTLC payments from BTC to ETH and back, using the Network as a single centralized intermediary that has both kinds of State Channels (assuming it acquires BTC through some other means). Eventually, we will implement full integration of the Bitcoin Lightning Network and a full Ethereum Lightning Network.


In the first version of Laconic, however, we will not work on interoperation between State Channel Networks.
Open vs Closed Interactions
Many Blockchains, after Ethereum, allow for arbitrary “smart contracts” to be written, binding their participants to follow any algorithmically verifiable rules as they interact with each other. These “smart contracts” enable participants to interact with each other in a way that aligns their interests—they are in many ways similar to legal contracts, but they are cheaper, faster and more predictable, though also more limited and more rigid.


We can distinguish between two kinds of interactions that can be mediated by a smart contract: open vs closed. A closed interaction takes place between a small finite number of participants who are all interested in the interaction making progress. An asset swap, a futures contract, a multisig contract, an inheritance contract, are closed interactions. An open interaction is one that isn’t closed: it can involve a changing set of participants; some may become interested after the interaction started and join; some may leave and cease to be interested in the interaction. A fungible token contract, a DAO, a yield farming contract, an AMM, are open interactions.


Often, an open interaction can be divided into many closed interactions connected by a part that is resolutely open. For example, an auction could be seen as many conditional payments by bidders in case they win in exchange for the auctioned goods—plus the publishing of bids and determination of the winner, which is resolutely open. An exchange order book could similarly be seen as a continuous double-auction that could also be divided in payments and matching.


Generalized State Channels can help scale closed interactions, and the closed interaction parts of larger open interactions. They cannot help with the resolutely open part of open interactions.


In the first version of Laconic, we will include and test minimal contract support for closed interactions conducted over a Generalized State Channel, for future use. We will not implement anything beyond this minimal support, and a fortiori we won’t implement a mix between open and closed interactions.
Closed Interactions over Generalized State Channels
The state updates of a simple State Channel divide the assets under control between participants in fixed amounts known in advance. For the lightning network, part of these amounts may be subject to a condition ensuring atomicity of transfers (see HTLC above). In a  Generalized State Channel, the state updates can carry arbitrary code and data. Some states clearly indicate that some assets may be claimed by some participants, and an agreed upon algorithm validates which state transitions are allowed for a participant to make even without the cooperation of others.


Thus, for instance, two participants may agree to a future swap contract, according to the price specified by some oracle. When the contract reaches maturity, and even if the other party fails to cooperate, an active participant can use the claim and challenge mechanism: he will reveal the latest state update, that contains the future swap contract; then he will reveal the state transition that executes the swap, given the oracle-provided price at the maturity date; finally he will wait for the end of the challenge period to get his assets out. Or then again, hopefully the other party gets their act together, resumes cooperation, and together they sign a settlement.


Closed interactions over Generalized State Channels embodies the analogy of “code as law”, wherein the blockchain consensus acts like a court system, and a good smart contract binds its signatories but only uses the consensus as a fallback in case something wrong happens. As long as the parties do as prescribed by the contract, the consensus is never invoked, except in the beginning to bind them, at the end to close the contract with a settlement, and potentially with intermediate settlements if any amendments are required. The adversarial part of the contract is only involved if one party (or more) stops cooperating, at which point the interaction becomes slow and onerous—and in the end it’s the party at fault who pays, if identified.


Given a Generalized Lightning Network, two participants could also interact with each other via a number of intermediaries, as long as there is enough collateral for the interaction at each step along the circuit. Special care is required to properly handle adversarial state transitions and collateral in presence of intermediaries.


In the first version of Laconic, we will implement and demonstrate a simple closed interaction over a Generalized State Channel. We will not implement interactions via intermediaries, which would be the topic of a further contract.
Channels with More Than Two Participants
In theory, a State Channel could have any finite number of participants. In practice, to scale beyond a handful of participants requires professionals or enlightened amateur willing and able to maintain high availability online servers.


Indeed, all the participants in a State Channel have to sign each and every state update. Whenever one participant stops cooperating, for whatever reason (accidental or adversarial, technical or legal, physical or virtual, etc.), all the other participants will waste time and have their capital immobilized while they exercise the adversarial claim and challenge option to expel the non-cooperating participant. In the worst case scenario, if multiple participants stop cooperating, the remaining participants will have to go through the claim and challenge process once per non-cooperating participant. This quickly becomes onerous as the number of participants grows.


A circuit involving the same N participants can, using sophisticated interlocking contracts at each channel, manage complex interactions. However, a channel with N participants is faster and more capital efficient; it allows transfers of assets not possible with circuits, and in particular, unlike circuits, it supports non-fungible tokens. A channel with N participants requires no additional trust assumption compared to a circuit with the same participants. The only downside is that once an interaction is over, the two-participant channels of a circuit could be re-organized to partake in new circuits, whereas a N-participant channel must be settled when any participant wants out.


In the first version of Laconic, we will only implement a simple interaction between two parties via a single generalized state channel without intermediaries. We will implement neither state channels with more than two participants nor interactions between many participants via a circuit. These more advanced constructions would be the matter for future projects.
Off-Chain Code
When using State Channels, most of the interaction occurs between participants using their respective off-chain code that runs on their individual computers. In the normal expected case of sustained cooperation, no on-chain contract code is ever invoked, except to open the state channel, close it, and possibly to deposit additional assets into the channel or withdraw assets from it through mutually agreed partial settlements. The participants’ off-chain code is also what drives the posting or non-posting of on-chain transactions when it is necessary for a participant to either make a claim or challenge a claim.


Off-chain code is essential for the proper operation of State Channels. It is also essential that the behavior of the off-chain code should exactly match the behavior of the on-chain code—otherwise, one or both of the participants is liable to lose their assets. Yet, the on-chain and off-chain code are typically written in totally different languages (e.g. JavaScript for off-chain code vs a special variant of Rust for on-chain code), and the off-chain code often needs several subtly different versions (different versions for each participant, different versions for the cooperative and adversarial cases, sometimes different versions for the UI and the underlying server or watchtower, etc.). Writing all the versions of the code consistently is no small challenge, especially when Generalized State Channels are involved, that can include arbitrarily complex logic that must be exactly matched in all those different versions, and remain in sync when the software evolves. To keep Generalized State Channels software manageable, it is recommended that developers should use a Domain Specific Language (DSL) that can coherently generate all the different matching variants of the code from a single specification.


In the first version of Laconic, we will only write off-chain code for the base cases that we demonstrate: payment, payment through one intermediary, payment in nested channels, and the simple closed interaction we choose. We will not be writing more general off-chain code to handle a complete Ethereum Lightning Network, and especially not be writing a DSL compiler targeting Generalized State Channels, though these could be the topic of future projects.
Action Plan
Step 1: Simple State Channels
We will write a set of contracts that implement State Channels, together with a client that can use them for fast payment between a user and the Network—enabling micropayments.


Estimated time: 1.5 months for 2 developers.
Step 2: Nested State Channels
We will build on-chain and off-chain code that implements Nested L23 State Channels on top of L12 State Channels.


Estimated time: 1.5 months for 2 developers.
Step 3: Payments with Intermediary
We will build on-chain and off-chain code that implements atomic payment with an intermediary using HTLCs. The Network will be the intermediary between parties, which makes discovery and routing trivial.


Estimated time: 1.5 months for 2 developers.
Step 4: Productizing the Network
Make sure the above code is ready for prime time, not just a working demo, etc.


Estimated time: 2.5 months for 2 developers.
Project Summary


Task
	Time required
	Step 1: 
	

	Step 2: 
	

	Step 3:
	

	Step 4:
	

	Step 5: 
	

	Step 6:
	

	Step 7:
	

	Total
	

	

Future Work
Our proposal is for the development of an initial, working, production-ready version. This initial version will be optimized for simplicity of development and launching fast. Its code may not be the best code for the long run; many obvious improvements may be possible.


The following steps are NOT scheduled to be completed as part of the present project, but as a follow up, after the completion of the present project.
Audit
Our proposal does not include an independent audit of our code.


We recommend Laconic should conduct or have a third party conduct, an independent audit, before blessing the code for production.


If such an independent audit is conducted in a timely fashion, we will integrate feedback from this audit (including simple fixes to any security issue found) as part of this work.
Maintenance
Our proposal does not include maintenance of the code after launch.


Maintenance covers fixing issues, adding features, improving performance, reducing costs, improving usability, producing additional documentation, etc.


Separate contracts will be required for that additional work, if Laconic is satisfied with the product being delivered.
Productization of a Decentralized Layer 2  Network
Our proposal does not include completing and productizing a complete Ethereum Lightning Network. We believe there is tremendous value in such a network, though that would be largely independent of Laconic itself. Here are the steps required to build such a network, if there is interest in the future.
* Demonstrating the possibility of integrating Ethereum State Channels from Laconic with the Bitcoin Lightning network, with a simple HTLC circuit across the two networks. 
* Implementing decentralized routing in a network.
* Implementing decentralized node discovery.
* Implementing negotiation with the nodes along the circuit.
* Implementing watchtowers for our Ethereum Lightning Network.
* Implementing each and every feature of the Bitcoin Lightning Network on Ethereum.
* Implementing nodes that know about both Bitcoin and Ethereum Lightning Networks and use some trusted data feed as an exchange rate oracle.
* Implementing routing across chains.
* Implementing strategies that optimize the liquidity for the Lightning Network across chains.
Contracts on top of State Channels
Our proposal does not include developing and productizing support for arbitrary contracts on Generalized State Channels, only to demonstrate their possibility on Ethereum as opposed to Bitcoin:
* Allowing for arbitrary contracts between two participants on a state channel.
* Allowing for arbitrary contracts between two participants with many intermediaries.
* Allowing for arbitrary contracts with any fixed number of participants on a single channel.
* Allowing for arbitrary contracts with any fixed number of participants on a circuit.
* Automatic generation of contract-and-off-chain code for two participants.
* Automatic generation of contract-and-off-chain code for any number of participants.
Bibliography
https://en.wikipedia.org/wiki/Lightning_Network
https://lightning.network
https://github.com/lightning/bolts
https://github.com/lightningnetwork/lnd


https://celer.network/
https://perun.network/