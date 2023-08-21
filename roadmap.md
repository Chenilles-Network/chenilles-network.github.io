---
Date:	May 2023 (Latest update August 17th 2023)
URL:	https://chenilles-network.github.io/roadmap.html
Author:	François-René Rideau <f@mukn.com>
Company:	Mutual Knowledge Systems, Inc. < https://mukn.com >
Address:	218 NW 24th Street, 2nd Floor, Miami FL 33127
---
# Chenilles Roadmap: a Scalable, Interoperable and Programmable State Channel Network

### Abstract

We propose a roadmap to design, build and market
the [*Chenilles* Network](https://chenilles-network.github.io/),
a new payment network that can transmit value across blockchains and currencies,
safely, at scale, with a direct connection to on-ramp and off-ramp solutions.
*Chenilles* will remove the main hurdles that prevent cryptocurrencies
from “going to the Moon”: scalability, safety and usability.

*Chenilles* is a next-generation Network of Generalized State Channels,
that embraces and extends the [Bitcoin Lightning Network](https://lightning.network/).
Like the Lightning Network and its first-generation copycats,
*Chenilles* is made of _State Channels_,
self-custodial “Layer 2” solutions that can off-load transactions from
a “Layer 1” blockchain and bring scalability without sacrificing safety.
Like the Lightning Network,
*Chenilles* enables atomic “network payments” from one participant to another
through a series of intermediaries using State Channels.
Unlike the Lightning Network and its first-generation copycats,
*Chenilles* can run on many blockchains,
potentially all of them (that feature scripting no worse than Bitcoin),
and it notably supports transfer of value from one cryptocurrency to the other,
from one blockchain to the other, and even
from on-ramp and to off-ramp solutions.
Unlike the Lightning Network and its first-generation copycats,
*Chenilles* also supports arbitrary smart contracts to be used by participants
while interacting with each other using State Channels.

Our roadmap emphasizes the early release of
partial but already useful and marketable products
as “low-hanging fruits” on the road to delivering a complete working product.
We will keep building along this roadmap, revising it based on market feedback.
As for what Layer 1 networks to support, we will prioritize
supporting the most liquid markets, which these days mean Ethereum and Bitcoin;
but we will also seek funding from various blockchain
foundations, companies and communities for *Chenilles*
to support their blockchains earlier and better.

## Introduction

### A plan to develop Chenilles

We presented in the
[Chenilles Glow whitepaper](https://chenilles-network.github.io/whitepaper.html)
our cross-blockchain Network of Generalized State Channels,
its overall vision, its capabilities, and how it will solve the main issues
that currently block cryptocurrencies from “going to the Moon”.

We also wrote a [conceptual introduction](https://chenilles-network.github.io/concepts.html)
that explains the concepts that underlie the design of *Chenilles*.

In this document, we will take as granted an understanding of these end goals
and technical means, and will focus on presenting
a plan to implement those goals using those means, that
maximizes earlier returns on lower investments.

### 



In the very first version of *Chenilles*, we will implement State Channels
by following the same principles as for the Bitcoin Lightning Network:
we will demonstrate micropayments between two participants
on a single “Layer 1 to 2” State Channel (L12).

### Path Payments with a Hub-and-Spoke Architecture

In a second version of *Chenilles*, We will support conditional payments through an HTLC,
     allowing for trustless atomic transactions from user to user,
     with some technical Intermediary
     who need not be trusted for safety (though indeed for liveness).

  3. We will demonstrate multiple nested “Layer 2 to 3” State Channels (L23)
     inside a single L12 State Channel,
     allowing for many independent transactions at the same time.

At that point, we will have a simple yet robust Hub-and-Spoke payment network.
with the configured Intermediary as the Hub.

### Connecting *Chenilles* and other State Channel Network

In a future version of *Chenilles*, the payment network we are creating
will interoperate with other State Channel Networks, by using compatible HTLC conditions:
* On Ethereum, Kchannels, the Raiden Network, Connext, Perun, Celer,
  [StateChannels.org](https://StateChannels.org), etc.
* On Bitcoin, the Bitcoin Lightning Network itself.
* On Cosmos, some state channel system using IBC.
* Any State Channel Network on any Blockchain with suitable HTLC contracts.

We would start by picking whichever are the easiest and the most popular State Channel Networks that we can work with, and demonstrate interoperability, then productize the result.

*Chenilles* will eventually include a complete implementation
of a Mother-of-All State Channel Network capable of interoperating with all the above.
It will involve an Ethereum variant of each of the 11 steps
of the Bitcoin Lightning BOLT specifications,
plus additional steps and further generalizations
so as to accommodate seamless interoperation between State Channel networks.

But even before then, it can be used for more special purpose payments,
for web3 utilities, for limited hub-and-spoke network with a semi-trusted intermediary,
or network of mutually semi-trusted intermediaries between which routing is easier.

We will not do any of that in the first version of our State Channels,
but we will keep our desire for compatibility somewhat in mind
when designing this initial version.

### Generalized State Channels
On Ethereum and other smart-contract capable blockchains (which does not include Bitcoin), State Channels can be used not merely for payments, but also for arbitrary conditional interactions between participants—be it a futures contract, an auction, a poker game, etc. State Channels with such functionality are called “Generalized State Channels”.

It is quite easy on Ethereum and similar blockchains to modify the basic State Channel infrastructure to accept Generalized State Channels—and much cheaper to add this functionality earlier than later. Thus we propose that the State Channel we implement for *Chenilles* should indeed be Generalized State Channels from the get go.

However, it is quite difficult to offer a programming environment that makes it safe and affordable to develop contracts on top of state channels: indeed, contracts must then be written in multiple versions in different languages, such that one version does the off-chain computation and signing of updates on layer 2, but another version does the on-chain verification and enforcement on layer 1—and the two have to match perfectly, or else one or both participants may lose their assets.

We will start by only offering a simple hand-written demonstration of
one simple contract on top of our infrastructure, to illustrate an
application that is possible with (Generalized) State Channels on *Chenilles*,
but impossible on Bitcoin.
Later on, we will develop a complete, safe and affordable
programming environment for contracts
on top of our Generalized State Channel infrastructure.

None of this support will be developed as part of
the first version of *Chenilles*.
However, it makes sense to develop this functionality in a future version of
*Chenilles*—if only so that users can get better guarantees
regarding the behavior of providers and/or members.
This support would also come naturally as a feature of a
Mother-of-All State Channel Network that can connect
with other State Channels on Ethereum and beyond.

## Plan Summary
We understand that Laconic is foremost interested in launching its platform, and that time is of the essence: the first version should be working in the next few months. Therefore, we propose to implement the smallest necessary subset of the features:

We thus propose to implement for the Laconic Network:

  1. Simple State Channels: As part of the Laconic contract’s “Vault”, functionality that implements state channels, together with a client that can use them for fast payment between two participants—enabling micropayments.

  2. Nested State Channels: Multiple L23 State Channels inside a single L12 State Channel.

  3. Payments with one intermediary: simple payments between two participants with the Network as a single intermediary, and routing payments between many participants using a hub-and-spoke network.

Each of these features will be demonstrated, then productized.

See below the section on Future Work for further features we propose to build for State Channels on Laconic.

## Underlying Concepts

### State Channels
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

### Nested State Channels
State Channel that only supports one interaction at once is limited in what it can accomplish. When the only interactions are one-way payments that are very fast, as in the Bitcoin Lightning Network, this might be good enough. But when using Generalized State Channels, or even things as simple as swaps, or when handling a lot of simultaneous incomplete transactions, it becomes necessary for a channel to support multiple interactions at the same time. For that purpose, a simple solution is for State Channels to have built in support for nested State Channels. One channel may therefore contain multiple sub-channels. In an adversarial claim, each of them could be one of the outputs of the settlement or state update, at least if some kind of UTXO model is used for such adversarial outputs. In an account-based system, either the same behavior could apply with new accounts created for each sub-channel as the result of an unchallenged claim, or the claims could be recursively handled with a small gas overhead at each level of nesting.

In the first version of Laconic, we will fully implement support for Nested State Channels in our on-chain contracts.

### Lightning Network
Given a network of State Channels, where each participant has one or more channels open with as many other participants, it becomes possible for one participant in the network to send tokens to another participant through intermediaries. For instance, participant A sends 5 tokens to participant B, who sends 5 tokens to participant C, etc., until participant Z receives 5 tokens from participant Y. As long as tokens are fungible and there is a “route” of channels from A to Z each with sufficient liquidity to cover the 5 tokens, then a transfer is possible. Very fast and cheap, private transactions become possible between all participants over amounts as small or as big as they are willing to handle.

For extra security, each intermediate transaction along the route can be made conditional on some triggering event, such that either all transfers happen, or none of them do. Bitcoin uses a “HTLC” for that (Hash Time-Lock Contract): the parties commit to a hash and a deadline, such that if the preimage to the hash is revealed before the deadline, the transfers happen, but if it isn’t, the transfer is canceled. Once all intermediaries along the way have signed their respective commitments, the preimage is revealed. To avoid attacks that lead to some participants losing due to a partial transfer, it is important for parties to sign in the correct order, for the deadlines of the respective commitments to be properly staggered, for these deadlines to interact well with the deadlines for the regular challenge mechanism, etc.

The main risk with State Channels is that some participant along a route you’re partaking in stops cooperating mid-transaction, and you and all the other participants have to pay fees to make a claim to close their channels and reopen new ones, their funds being blocked until timeout (for a week), the associated liquidity thus made unavailable. This risk increases as the routes get longer and involve participants who aren’t vetted for their good behavior. To offset this risk and to compensate them for making their liquidity available, reputable intermediaries will charge small fees to the participants who use the network.

In the first version of Laconic, we will implement HTLC support and demonstrate transfer with the Network as a single intermediary. We will not implement general support for transfer with many intermediaries, which is not conceptually harder but is more work than necessary for our value demonstration purposes.

### Payment Routing
The proper use of HTLC allows for safe payment across a circuit with well-identified cooperating participants each possessing suitable assets in their respective State Channels. But how is this circuit to be established to begin with? Given a map of the Lightning Network as a graph, where each participant (who may control multiple addresses) is a node that may be more or less expected to successfully do its job, where each State Channel is an arc joining two nodes, where the current state of each State Channel describes the capacity of the arc in each direction, and each direction of each arc has a documented fee structure, well-known algorithms can find an optimal circuit or set of circuits to transfer a given amount from point A to point B while minimizing fees, maximizing expectation of success, or any given performance metric. Now, how is this map to be obtained, to begin with? Some service discovery mechanism is required. Then there are questions regarding how to keep this map up-to-date, how to avoid bad actors from poisoning the dataset, or from spying on the participants, how to maintain privacy with a routing algorithm that requires less of a map or one that reveals less data, etc.

The Bitcoin Lightning Network has answers to all these questions. These answers could probably be largely reused for an Ethereum Lightning Network, with some small adaptations. But to demonstrate as much value as possible with as little upfront investment as possible, we can restrict ourselves to a solution that works in the simplest of cases: payment through a single centralized intermediary. The sender and recipient can simply tell each other which of many intermediaries they support, in decreasing order of preference, until they find a suitable one; then they initiate a payment using this single intermediary. A network where every participant is connected to the same intermediary is called a “hub and spokes” network in reference to a bicycle wheel.

In the first version of Laconic, we will only implement routing in a very simple hub-and-spokes network with a single centralized intermediary. We will implement neither decentralized discovery of a network nor general routing in an arbitrary network: they are neither conceptually novel nor specific to Nervos, and are thus unnecessary for our value demonstration purposes.

### Interoperation Between Blockchains
It is possible for State Channel Networks to interoperate with other State Channel Networks on other blockchains. For instance, participant A could send 1 BTC to participant B using a State Channel on Bitcoin, and B could then send 16 ETH to participant C on Ethereum, or whatever amount corresponds to the mutually agreed upon exchange rate. A and C would presumably pay a fee to B for providing the liquidity, but would otherwise be able to each use their preferred token on their preferred network as part of a same transaction with mutually agreeable amounts. Longer routes are possible across multiple blockchains, but in practice, participants will usually want to minimize the number of expensive currency exchanges along the route.

For interoperability, we will implement on top of Laconic State Channels a HTLC compatible with that of the Bitcoin Lightning Network: the hash function will be the same, the same deadline policy will be used, etc. Then, we will write a program that can simultaneously and coherently drive State Channels on both Laconic and Bitcoin, thus achieving transfers across blockchains. We will then demonstrate HTLC payments from BTC to ETH and back, using the Network as a single centralized intermediary that has both kinds of State Channels (assuming it acquires BTC through some other means). Eventually, we will implement full integration of the Bitcoin Lightning Network and a full Ethereum Lightning Network.

In the first version of Laconic, however, we will not work on interoperation between State Channel Networks.

### Open vs Closed Interactions
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

### Channels with More Than Two Participants
In theory, a State Channel could have any finite number of participants. In practice, to scale beyond a handful of participants requires professionals or enlightened amateur willing and able to maintain high availability online servers.

Indeed, all the participants in a State Channel have to sign each and every state update. Whenever one participant stops cooperating, for whatever reason (accidental or adversarial, technical or legal, physical or virtual, etc.), all the other participants will waste time and have their capital immobilized while they exercise the adversarial claim and challenge option to expel the non-cooperating participant. In the worst case scenario, if multiple participants stop cooperating, the remaining participants will have to go through the claim and challenge process once per non-cooperating participant. This quickly becomes onerous as the number of participants grows.

A circuit involving the same N participants can, using sophisticated interlocking contracts at each channel, manage complex interactions. However, a channel with N participants is faster and more capital efficient; it allows transfers of assets not possible with circuits, and in particular, unlike circuits, it supports non-fungible tokens. A channel with N participants requires no additional trust assumption compared to a circuit with the same participants. The only downside is that once an interaction is over, the two-participant channels of a circuit could be re-organized to partake in new circuits, whereas a N-participant channel must be settled when any participant wants out.

In the first version of Laconic, we will only implement a simple interaction between two parties via a single generalized state channel without intermediaries. We will implement neither state channels with more than two participants nor interactions between many participants via a circuit. These more advanced constructions would be the matter for future projects.

### Off-Chain Code
When using State Channels, most of the interaction occurs between participants using their respective off-chain code that runs on their individual computers. In the normal expected case of sustained cooperation, no on-chain contract code is ever invoked, except to open the state channel, close it, and possibly to deposit additional assets into the channel or withdraw assets from it through mutually agreed partial settlements. The participants’ off-chain code is also what drives the posting or non-posting of on-chain transactions when it is necessary for a participant to either make a claim or challenge a claim.

Off-chain code is essential for the proper operation of State Channels. It is also essential that the behavior of the off-chain code should exactly match the behavior of the on-chain code—otherwise, one or both of the participants is liable to lose their assets. Yet, the on-chain and off-chain code are typically written in totally different languages (e.g. JavaScript for off-chain code vs a special variant of Rust for on-chain code), and the off-chain code often needs several subtly different versions (different versions for each participant, different versions for the cooperative and adversarial cases, sometimes different versions for the UI and the underlying server or watchtower, etc.). Writing all the versions of the code consistently is no small challenge, especially when Generalized State Channels are involved, that can include arbitrarily complex logic that must be exactly matched in all those different versions, and remain in sync when the software evolves. To keep Generalized State Channels software manageable, it is recommended that developers should use a Domain Specific Language (DSL) that can coherently generate all the different matching variants of the code from a single specification.

In the first version of Laconic, we will only write off-chain code for the base cases that we demonstrate: payment, payment through one intermediary, payment in nested channels, and the simple closed interaction we choose. We will not be writing more general off-chain code to handle a complete Ethereum Lightning Network, and especially not be writing a DSL compiler targeting Generalized State Channels, though these could be the topic of future projects.

### Action Plan
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

## Project Summary

## Future Work
Our proposal is for the development of an initial, working, production-ready version. This initial version will be optimized for simplicity of development and launching fast. Its code may not be the best code for the long run; many obvious improvements may be possible.

The following steps are NOT scheduled to be completed as part of the present project, but as a follow up, after the completion of the present project.

### Audit
Our proposal does not include an independent audit of our code.

We recommend that any big users and customers of *Chenilles* should
conduct an independent audit, or have a third party conduct such an audit
before blessing the code for production.

If such an independent audit is conducted in a timely fashion,
we will integrate feedback from this audit
(including simple fixes to any security issue found) as part of this work.

### Maintenance
Our proposal does not include maintenance of the code after launch.

Maintenance covers fixing issues, adding features, improving performance, reducing costs, improving usability, producing additional documentation, etc.

Separate contracts will be required for that additional work, if initial customers
are satisfied with the product being delivered.

### Productization of a Decentralized Layer 2 Network

We believe there is tremendous value in eventually completing and productizing
a complete Ethereum Lightning Network.
Here are the steps required to build such a network,
when there is enough interest in the future.

  * Demonstrating the possibility of integrating Ethereum State Channels
    from *Chenilles* with the Bitcoin Lightning network, with
    a simple HTLC circuit across the two networks
    and an existing wrapped BTC contract.

  * Implementing decentralized routing in a network.

  * Implementing decentralized node discovery.

  * Implementing negotiation with the nodes along the circuit.

  * Implementing watchtowers for our Ethereum Lightning Network.

  * Implementing each and every feature of the Bitcoin Lightning Network on Ethereum.

  * Implementing nodes that know about both Bitcoin and Ethereum Lightning Networks
    and use some trusted data feed as an exchange rate oracle.

  * Implementing routing across chains.

  * Implementing strategies that optimize the liquidity for the Lightning Network across chains.

### Contracts on top of State Channels

We strongly believe in the value of eventually developing and productizing
support for arbitrary contracts on Generalized State Channels,
if only to demonstrate their possibility on Ethereum as opposed to Bitcoin:

  * Allowing for arbitrary contracts between two participants on a state channel.

  * Allowing for arbitrary contracts between two participants with many intermediaries.

  * Allowing for arbitrary contracts with any fixed number of participants on a single channel.

  * Allowing for arbitrary contracts with any fixed number of participants on a circuit.

  * Automatic generation of contract-and-off-chain code for two participants.

  * Automatic generation of contract-and-off-chain code for any number of participants.

## Project Description

*Chenilles* is a next-generation cross-blockchain State Channel Network.
We, at [*Mutual Knowledge Systems*](https://mukn.io/),
a.k.a. MuKn (pronounced “Moon” — the K is silent),
have already started building *Chenilles*, on Ethereum.

### Benefits of State Channels in General

With *Chenilles* as with all State Channels:

- Two participants in a channel can send tokens to each other safely, cheaply, quickly and *privately*, scaling far beyond what Layer 1 supports.
- Participants can safely, cheaply, quickly, atomically and privately send fungible tokens along a circuit of State Channels of sufficient liquidity, in network such as the Bitcoin Lightning Network.

### Innovative Extra Benefits of *Chenilles* Network

Beyond what other State Channel networks do:

- The *Chenilles* Network enables participants to send tokens *across blockchains*, so you can send FIL and the recipient would get ETH, or vice versa.
- The *Chenilles* Network can potentially interoperate with any other State Channel Network, including the Bitcoin Lightning Network itself.
- *Chenilles* allows not just two participants, but tens of participants, on a same State Channel, as long as they all keep cooperating in a timely manner.
- *Chenilles* allows not just one kind of token (e.g. FIL, ETH or BTC) on a State Channel, but any number of token kinds including NFTs (e.g. FIL, some ERC20s and some ERC721s).
- *Chenilles* can scale not just payments, but arbitrary contracts, between its participants (e.g. swaps, futures, market making, insurance, auctions, poker games, etc.)
- *Chenilles* can multiplex many nested State Channels within an existing State Channel, such that many concurrent conditional transactions can be executed at the same time on a single State Channel.
- *Chenilles* allows contracts to be written once in a single language, *Glow*, that is safe, concise and portable, when other Networks require contracts to be written identically in two or three unsafe languages (e.g. Solidity, Go and JS for contracts on Celer) wherein any issue in any of the three variants and any discrepancy between them may cause asset loss.
- *Chenilles* with *Glow* will support compiling contracts to zk-SNARKs using Lurk, such that terms of the contract remain private even in case of timeout and non-cooperative exit from the State Channel.
- *Chenilles* enables use of blockchain-specific capabilities, such that State Channel contracts on Filecoin can invoke payment conditions based on the data stored on network.

### Value

The technical capabilities of *Chenilles* set it far ahead of current State Channel technology. Therefore the value generated by adding liquidity to the *Chenilles* Network will be vastly superior to that of adding it to existing networks. By funding the development of *Chenilles* through a grant:

1. Filecoin will increase the scalability and privacy of transactions on the Filecoin network, thereby creating utility for Filecoin users, and increasing the value of the network and its token.
2. Filecoin will interoperate with other blockchains in a safe and efficient way, increasing the value both of Filecoin and of those other blockchains.
3. Filecoin will become an early adopter of the *Chenilles* network and of *Glow* and capture a larger part of their mindshare than the other blockchains that will only be supported later.
4. Filecoin will create synergies with Filecoin’s Lurk platform (that we at MuKn are also working on), wherein by combining a Lurk contract and a State Channel, the Lurk contract interactions can be made to scale whereas the contractual conditions attached to the State Channel will remain private even in case of non-cooperative exit.

The *Chenilles* network can be an extremely valuable addition to the Filecoin ecosystem. At the same time, Filecoin can better foster the appearance of such a network by funding this addition through a grant to a blockchain-agnostic entity like MuKn than by building it in-house. Indeed, an entity tied to a specific blockchain might cause some other blockchains to fear giving an advantage to whichever rival appears as the leader, whereas a blockchain-agnostic entity will reassure them that they will get a fair treatment in a cross-chain network that benefits all participants.

## Deliverables

### Low-hanging Fruits in a Tall Tree

Our complete plan for *Chenilles* goes all the way from implementing single State Channels to building a payment and smart-contract network that interoperates with other State Channel networks such as the Bitcoin Lightning Network, as well as a financial settlement system that leverages this technical infrastructure. However, we divided this plan in shorter phases such that each phase produces a deliverable that noticeably enhances the value of the Filecoin network, with compounded effects as the deliverables build upon each other. Thus, however far Filecoin is willing to fund this project, it will reap super-linearly increasing benefits from its investment.

Filecoin does not have to commit to the entire plan initially. Morever, however much Filecoin puts on the table, it will pay in monthly installments and keep the option to terminate the project at any time (with one month notice) should MuKn not demonstrate satisfactory progress. Nevertheless, earmarking funds for a larger development will allow MuKn to staff the project with a more stable permanent team that can be completely focused on the project. An even larger earmark may also allow to parallelize those efforts that can be parallelized, leading to earlier delivery of a complete product than a trickle that can only afford a smaller team at a time.

Should Filecoin be only willing to fund part of the project at first, we can complete the project later based on further grants from Filecoin after the initial deliverables have been evaluated, or by finding investors who see the financial potential of *Chenilles* as a cross-chain payment and smart-contract network. However big or small the initial grant, discussions for further funding would ideally start early enough that development could continue uninterrupted, whether funded by grants or by investment.

### Overview of Deliverables

Here is a short description of each of the successive phases of development that we have planned, and what deliverables or increasing functionality will be built at each stage. We omit the many subphases in each phase and their individual deliverables:

1. **Simple State Channels**
This phase will create the building block of *Chenilles*, the simplest of State Channels, implemented on top of Filecoin’s FVM. The deliverable will enable scalable micropayments between two participants on Filecoin.
2. **State Channel Paths**
This phase will enable participants with a series of connected State Channels to build a *path* along which payments can be safely made from a sender to a recipient through a series of intermediaries. The deliverable will enable scalable routing of micropayments with explicit paths (a la Bitnet).
3. **State Channel Network**
This phase will enable participants who are not directly connected by a State Channel to dynamically discover and use paths of intermediaries to route conditional payments. The deliverable will enable scalable routing of micropayments with implicit paths (a la Internet).
4. **Cross-Chain State Channel Paths**
This phase will enable participants to use paths that cross blockchain boundaries to effect payments between Filecoin, Ethereum and Bitcoin. The deliverable will enable scalable routing of micropayments across blockchains with explicit chain crossings.
5. **Cross-Chain State Channel Network**
This phase will enable participants to discover and use intermediaries to effect payments across blockchains between Filecoin, Ethereum and Bitcoin. The deliverable will enable scalable routing of micropayments across blockchains with implicit chain crossings.
6. **Smart Contract Enhancements**
This phase will enhance the *Chenilles* Network so as to enable arbitrary smart contracts between a small number of participants to be conducted through State Channels. This will put our State Channel Network far ahead of existing networks, that in practice support no such thing, though some do in theory. At each step, we will enhance our language *Glow* to implement the additional features through State Channels. The deliverable will be a rich contract system on top of *Chenilles*.
7. **Privacy Enhancements**
This phase will enhance the *Chenilles* Network so as to make its transactions completely opaque to non-participants, including the presence of the State Channels themselves. The deliverable will reinforce the privacy of payments over State Channels.
8. **Financial Layer**
Once the technical layer is sufficiently advanced (which can start right after phase 2), we will contact people with liquidity and get them to add liquidity on *Chenilles* by prioritizing the development of the features they most want, including which financial contracts we should first support (e.g. futures, auctions, etc.). The deliverable will be a financial network that uses the technical infrastructure of *Chenilles*.

## Development Roadmap

Our development will include the following phases.

We estimate costs in abstract units of developer-week (or *dvwk* for short), which represents one week of work by one developer assigned full-time on the project, but which also accounts for technical leadership costs, management costs, administrative costs, consulting costs (for when the main assigned developer needs help from another expert), ancillary costs, amortized software and hardware costs, etc.

To account for the above, we estimate a monetary cost of $5000/dvwk for a short-term grant. This cost can decrease if Filecoin is willing to commit to a long term development grant and/or to shoulder the risk of cost overrun.

Actual delivery time for any step may be shorter than the estimated number of developer-weeks (if work is somewhat parallelizable between multiple developers, within the limits of Amdahl’s Law), but will likely longer (due to various delays, sickness, vacations, etc.). On the other hand, given sufficient budget, some phases can be executed wholly in parallel with other phases by distinct developers (e.g. phases 6 to 8 vs other phases between 3 and 8).

### Phase 1: ***Simple State Channels***

This phase will create the building block of *Chenilles*, the simplest of State Channels, implemented on top of Filecoin’s FVM, that enables micropayments between two participants. It will be subdivided in steps as follows:

1. A study of how best to implement State Channels on Filecoin: what interfaces to use, amend or add—helping better estimate development costs. (6 dvwk)
2. The simplest implementation of State Channels, including both a smart contract for the FVM and client code capable of communicating with it—enabling micropayments. (6 dvwk)
3. A robustization of the above, making for State Channels that can be trusted with actual tokens, rather than a mere demonstration that assumes favorable conditions. (12 dvwk)
4. Integration of State Channels with the standard Filecoin wallet—allowing for micropayments by regular Filecoin users rather than merely by programmers familiar with a command-line. (12 dvwk)
5. Documentation for all the above, including a live recorded demonstration, and addressing issues found while documenting. (18 dvwk)

As with every phase of our plan, it is conceivable to stop at the end of any step and have made measurable progress towards improving the value of Filecoin, but we recommend going all the way to the end of a phase for this progress to generate tangible value to end-users of the Filecoin network. Thus for $30,000 we could stop at the study; for $60,000 we could have a working demo; for $120,000 we could have a robust prototype; for $180,000 the prototype can be integrated with a standard Filecoin wallet, and for $270,000 the entire thing can be documented and debugged such that regular users can use it.

Furthermore, if payment of each step is made conditional on the previous step, then development will take an entire year by a single developer. However, if the entire phase is authorized in advance and paid in larger monthly installments, 2 to 3 developers can work together in parallel and make it happen in 6 to 9 months.

Below are details on each of the steps.

**Discovery**: We will start with a study in which we will examine in depth how our existing *Chenilles* technology does or doesn’t fit in the Filecoin ecosystem: what facilities we can reuse of *Chenilles* and of Filecoin, what functionality we must custom-build for Filecoin vs other blockchains, which interfaces we must hook into (e.g. wallets), what features the interested parties in the Filecoin community deem more important, etc. Detailed plans will be written to determine exactly which features will be implemented in each of the subsequent phases. While this step limits its deliverable to specifications, documentation, and requirements for future steps and phases, it is fundamental to a successful phased roll-out of the system. Questions we will answer will include:

- What will the FVM contract generally look like? What implementation strategies will we follow?
- Does the FVM presently have all the capabilities required to efficiently implement State Channels? Either way, how precisely will which of its capabilities be used or amended?
- Same questions for the Filecoin client (or server) APIs we will use or amend.
- Which multisignature algorithm(s) should we support at first for the “happy” consensual case? (e.g. ECDSA, Schnorr, BLS).
- Which parts of our Ethereum contract and client infrastructure can we reuse as is, versus which must be generalized, and which must be reimplemented in the new particular setting?
- How should the client persistent storage fit with the Filecoin ecosystem?
- How should or shouldn’t we integrate with authentication systems or “wallets” commonly used within the Filecoin community, to handle participant identities and funds under automatic management of DApps?
- Do our designs as pertain to the Filecoin ecosystem pass a preliminary review from a competent cryptographer?

We estimate this initial study to cost about 5 developer-weeks. From the study will also come a better estimate for the costs of the following steps and phases.

**Prototype**: We will implement the simplest kind of State Channels for Filecoin, according to the plan established during Discovery, reusing as much as possible of our State Channels for Ethereum. These State Channels may have a minimal set of features: only two participants, only one single token kind, no conditional payment, no nested channels, no interface beside the command-line, no wallet integration, no persistence of session information. But they will support non-cooperative as well as cooperative exit. As a proof of concept, the prototype will be focused on demonstrating feasibility, rather than making a complete product. Reasonable effort will be made so the prototype should be secure, but corners may be cut as long as they are well-documented.

**Robustization**: Once the prototype establishes the feasability of the endeavor, we will turn it into a robust product. We will add all the missing security checks and handle all the corner cases. However, we will not add any feature beside what is required for security. In particular, we will stick to a developer-friendly but end-user-unfriendly command-line interface, and we will not attempt to integrate with existing Filecoin wallets (which we will do in the following step). We will not add support for more than two participants, or more than one token kind (e.g. FIL, ERC20, etc.), nested state channels, or any other functionality. We will just turn the prototype into something robust.

**Integration**: After we have a robust implementation of those minimal State Channels for Filecoin, we will integrate them with the most relevant Filecoin wallet, so that end-users of Filecoin may actually use them for micropayments. As above, we will otherwise stick to a minimal set of features.

**Documentation**: We will write a tutorial explaining on how to use our State Channels, as well as some internal architectural description of how they work underneath. We will record a demonstration and a tutorial for opening a State Channel on Filecoin, making back and forth micropayments, and closing the Channel cooperatively, or closing it non-cooperatively. Together with documentation come some additional debugging and simplifications for issues that only become apparent as we actively try to make the product user-friendly.

Not that emphatically not included in the above is an independent security audit of the product, that must be conducted by a third party. We can help connect Filecoin with such auditors if desired.

### Phase 2: ***State Channel Paths***

This phase will enable participants with a series of connected State Channels to build a *path* along which payments can be safely made from a sender to a recipient through a series of intermediaries.

This phase can be divided in the steps, each with its own value-adding deliverable. In turn each of these steps could be divided into sub-steps of study, prototype, robustization, user-interface and documentation, though with a quicker development cycle thanks to building on previous code. Once again, development can be achieved cheaper and/or faster if committing in advance to larger phases or steps rather smaller steps or sub-steps, hiring larger teams working in parallel (though with increasing communication overhead as the teams grow), and starting each phase or step as soon as the strictly necessary previous steps are working without waiting for all previous steps to be complete and reviewed.

The steps are as follows:

1. Nested and Generalized State Channels, enabling multiple conditional payments at a time over a single State Channel. (18 dvwk)
2. The simplest Hashed TimeLock Contract (HTLC) as a payment condition—enabling safe payments with a timeout to unlock funds in case one party fails to cooperate to the end. (12 dvwk)
3. An off-chain communication protocol based on libp2p, so network participants who already know each other and their intermediaries can coordinate their multi-hop transactions. (18 dvwk)
4. The combination of the above, so a sender may drive a series of payments, along a path of State Channels, through identified intermediaries, to a recipient. (12 dvwk)
5. A demonstration of micropayments along a path of multiple State Channels on Filecoin. (6 dvwk)
6. As a useful application, a simple hub-and-spoke network can route payments from any participant to any other participant via a single common intermediary, centralized yet non-custodial. This isn’t the desired decentralized network (to be built in the next phase), but can illustrate the technology so far, make it readily usable even before the full network is ready, and can serve as the financial seed to the decentralized network to come. (18 dvwk)

### Phase 3: ***State Channel Network***

This phase will enable participants who are not directly connected by a State Channel to dynamically discover and use paths of intermediaries to route conditional payments.

Note: our estimates for this phase and the subsequent phases are not fleshed out, and could be 2x or 3x too large or too small, but we believe remain of the correct indication of the order of magnitude. The time required also depends on the team we will be able to hire which depends on the budget allotted and whether it is committed in advance.

1. An off-chain protocol to announce and discover the nodes in a State Channel Network. (18 dvwk)
2. An algorithm to discover paths along which to route payments in a known graph of nodes. (18 dvwk)
3. A protocol to negotiate payment along a planned path. (18 dvwk)
4. A protocol combining the above to automatically route payments on the Network. (18 dvwk)
5. A protocol to rate and blacklist uncooperative nodes in the State Channel Network. (18 dvwk)
6. A protocol to split a payment along several paths. (18 dvwk)

### Phase 4: ***Cross-Chain State Channel Paths***

This phase will enable participants to use paths that cross blockchain boundaries to effect payments between Filecoin, Ethereum and Bitcoin.

1. A modification of the HTLC contract to account for currency exchange rates and their volatility, and the issue of a State Channel payment being an *option* for the sender. (18 dvwk)
2. An extension to the off-chain *Chenilles* communication protocols so payments can be made along a path that involves State Channels on both Filecoin and Ethereum at some agreed exchange rate, properly compensating the party doing the exchange. (18 dvwk)
3. A variant of HTLC that can interoperate with the Bitcoin Lightning Network—enabling *Chenilles* on Filecoin to connect to the liquidity already available on Bitcoin, with proper handling of exchange rate volatility and payment option issues whether sending or receiving Bitcoin, despite Bitcoin itself having a very limited scripting language so that any complex logic must be on the Filecoin side. (18 dvwk)
4. An extension to the off-chain *Chenilles* communication protocol so it can interoperate with paths on the Bitcoin Lightning Network at some agreed exchange rate. (18 dvwk)
5. A demonstration of micropayments not just along a path on the Filecoin *Chenilles* Network, but also along a path that involves State Channels on the Bitcoin Lightning Network. (18 dvwk)
6. A variant of *Chenilles* that can transmit wrapped Bitcoin or wrapped Ethereum on State Channels on Filecoin, which can displace the exchange rate issue so it’s fully handled on Filecoin. (18 dvwk)

### Phase 5: ***Cross-Chain State Channel Network***

This phase will enable participants to discover and use intermediaries to effect payments across blockchains between Filecoin, Ethereum and Bitcoin.

1. An extension to the off-chain *Chenilles* routing protocols so it can discover intermediaries and negotiate exchange rates between the Filecoin *Chenilles* Network and the Ethereum *Chenilles* Network. (18 dvwk)
2. An extension to the off-chain *Chenilles* routing protocols so it can discover intermediaries and negotiate exchange rates between the Filecoin *Chenilles* Network and the Bitcoin Lightning Network. (18 dvwk)
3. Demonstrating payments across blockchains. (18 dvwk)
4. Extend the *Chenilles* Network with counterparts for each and every feature that the Bitcoin Lightning Network possesses, to ensure complete interoperability. (18 dvwk)
5. Similarly, ensure that *Chenilles* have feature parity and interoperability with Celer or any other relevant State Channel Network already established. (18 dvwk)

### Phase 6: ***Smart Contract Enhancements***

This phase will enhance the *Chenilles* Network so as to enable arbitrary smart contracts between a small number of participants to be conducted through State Channels. This will put our State Channel Network far ahead of existing networks, that in practice support no such thing, though some do in theory. At each step, we will enhance our language *Glow* to implement the additional features through State Channels.

1. State Channels that can transfer more than one kind of asset. Example: FIL and ERC20s including wrapped Ethereum or wrapped Bitcoin. (18 dvwk)
2. State Channels with a complex interaction but without external data sources. Example: rock paper scissors. (18 dvwk)
3. State Channels with a complex interaction using external data sources. Example: a futures contract that relies on a price oracle. (18 dvwk)
4. State Channels with more than two participants. Example: a four-way card game. (18 dvwk)
5. Using State Channels as conditional payment for a public contract. Example: an auction with private bids over State Channels. (18 dvwk)
6. Using State Channel paths for exchange between more than two parties. Example: a three-way atomic swap between three assets across triangular payment paths. (18 dvwk)

### Phase 7: ***Privacy Enhancements***

This phase enhance the *Chenilles* Network so as to make its transactions completely opaque to non-participants, including the presence of the State Channels themselves. This phase could be done largely in parallel with phases 3 to 5.

1. Use of a Schnorr multisig contract as a gateway protecting a State Channel, enhancing both the efficiency of the network and its privacy. (18 dvwk)
2. Use of zk-SNARKs via Lurk to add privacy to payment conditions even when closing channels without the full cooperation of all members. (18 dvwk)
3. Modification of the off-chain communication protocols to allow for private State Channels. (18 dvwk)
4. Add a store-and-forward relay service to the off-chain communication network for asynchronous communications between parties, and/or support encrypted email (e.g. via protonmail or tutanota) as a medium for exchanging messages. (18 dvwk)
5. Demonstration of completely opaque State Channel payments on Filecoin. (18 dvwk)

### Phase 8: ***Financial Layer***

Once the technical layer is sufficiently advanced (which can start right after phase 2), contact people with liquidity and convince them to make some available on *Chenilles*, and/or ask them which features we should prioritize to get them to add liquidity on *Chenilles*, including which financial contracts (e.g. auctions, futures, etc.) we should first support.

1. Contact liquidity providers, starting as early as we have a working system, and increasing exponentially as we ramp up the features. (18 dvwk)
2. Prioritize and implement whichever features they most need. (18 dvwk)
3. Implement a service for paid-for watch towers. (18 dvwk)

## Total Budget Requested

We propose that to start with, Filecoin would fund the initial study and prototype, at a cost of $60,000.00, with a 2-month estimated duration and a 3-month hard deadline.

Assuming that the Filecoin Foundation is happy with this initial proposal, we would further extend or renew the proposal so that Filecoin complete phase 1 (a further cost of $210,000.00), yielding a robust and documented implementation of simple State Channels well integrated with the Filecoin ecosystem.

We would then convene to determine who would invest how much towards the completion of the rest of the project. Presumably, a first funding round of about $500K would allow us to complete Phase 2, wherein Filecoin would have robust and practical payment network, allowing micropayments across known paths, and in particular in an initial hub-and-spoke network. A second round of about $2M to $5M would allow us to complete the technical development of the network. A third round would bootstrap the liquidity on the network and fund its business development as a payment platform serving a lot of users.

## Team

### Contact Info

`fare@mukn.io`

### Team Members

- François-René Rideau, President & Chief Scientist
- Alexander Smart, Chief Executive Officer
- Peter Hubshman, Chief Financial Officer
- Zoe Braiterman, Chief Information Officer
- Gauthier Lamothe, Chief Communication Officer
- Alex Hochberger, Chief Product Officer & Chief Technology Officer
- Marcin Grzybowski, Vice President of Formal Methods
- Donald Fisk, Senior Scientist

### Team Member LinkedIn Profiles

- [https://linkedin.com/in/fahree](https://linkedin.com/in/fahree)
- [https://linkedin.com/in/alexandersmart](https://linkedin.com/in/alexandersmart)
- [https://www.linkedin.com/in/peterhubshman/](https://www.linkedin.com/in/peterhubshman/)
- [https://www.linkedin.com/in/zoebraiterman/](https://www.linkedin.com/in/zoebraiterman/)
- [https://linkedin.com/in/gauthier-lamothe](https://linkedin.com/in/gauthier-lamothe)
- [https://www.linkedin.com/in/alexhochberger/](https://www.linkedin.com/in/alexhochberger/)

### Team Website

[https://mukn.io](https://mukn.io/)

### Relevant Experience

Relevant previous work by our contributors are listed in the Wiki for our *Glow* language:

[https://github.com/Glow-lang/glow/wiki/Bibliography-Glow](https://github.com/Glow-lang/glow/wiki/Bibliography-Glow)

We also have successfully worked with Filecoin in a past grant: [*Glow* on Lurk](https://github.com/filecoin-project/devgrants/issues/405)

### Team code repositories

Our *Glow* programming language: [https://github.com/Glow-Lang/glow](https://github.com/Glow-Lang/glow)

The State Channel network we have started building, presently on top of Ethereum only, though the design is portable: [https://github.com/MuKnSys/Chenilles](https://github.com/MuKnSys/Chenilles)

More repositories of code we built at [https://github.com/MuKnSys](https://github.com/MuKnSys)

## Additional Information

MuKn has worked among others with
IOHK (now IOG, that develops Cardano), Nervos, Harmony One, Filecoin, and the Laconic Network.
