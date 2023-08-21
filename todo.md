# TODO

Stuff cut from other documents, to include into these pages.

See also:

  * The Filecoin grant proposal at https://github.com/filecoin-project/devgrants/issues/1449

  * Feedback from the MINA zkignite program: https://zkignite.minaprotocol.com/zkignite/dev4dev/refineproposals/suggestion/585 and https://zkignite.minaprotocol.com/zkignite/dev4dev/refineproposals/suggestion/585/discussions

## State Channels Networks: Payments At Scale

### An Overlay Network above a Blockchain

Network payments from one participant to the next
along a path of state channels potentially enable anyone to reach anyone else
on the State Channel network.

on a “Layer 2” network of point-to-point “channels”
each built on top of Bitcoin’s “Layer 1” blockchain.

The Layer 1, i.e. posting transactions directly on the blockchain,
is always simpler and safer than any Layer 2;
but the Layer 2 of State Channels allows for more transactions,
cheaper, faster, and more privately, than is possible on the Layer 1.

## Connecting *Chenilles* with other State Channel Network

With suitable developments, the payment network we are creating can interoperate with other State Channel Networks, by using compatible HTLC conditions.

The first network that *Chenilles* for Filecoin will interoperate with will be the Ethereum variant of *Chenilles* that we have been developing to enable atomic micropayment of services for the [Laconic Network](https://laconic.com/), because it will require the least amount of work.

The second network that *Chenilles* for Filecoin will interoperate with will be the Bitcoin Lightning Network, the only State Channels network that currently possesses serious traction.

It will then be possible to exchange tokens at scale between FIL, ETH, BTC and any other tokens on the same networks.

There are or have been many other existing State Channel networks on Ethereum (such as Kchannels, Raiden, Connext, Perun, Celer, [StateChannels.org](http://statechannels.org/), etc.), and possibly on other blockchains, too. And there may be other blockchains worth to which to port *Chenilles*. When *Chenilles* is more advanced, we will consider which are worth interoperating with.

A complete implementation of a Mother-of-All State Channel Network capable of interoperating with all the above will probably be its own project separate from Laconic as such—though it could use Laconic as a springboard to launch better and faster. Such a Network will involve an Ethereum variant of each of the 11 steps of the Bitcoin Lightning BOLT specifications, plus additional steps and further generalizations so as to accommodate seamless interoperation between State Channel networks.

We will not do any of that in the first version of our State Channels in phase 1, but we will keep our desire for compatibility somewhat in mind even when designing this initial version.



## Generalized State Channels: Smart Contracts


### Nested State Channels

State Channel that only supports one interaction at once is limited in what it can accomplish. When the only interactions are one-way payments that are very fast, as in the Bitcoin Lightning Network, this might be good enough. But when using Generalized State Channels, or even things as simple as swaps, or when handling a lot of simultaneous incomplete transactions, it becomes necessary for a channel to support multiple interactions at the same time. For that purpose, a simple solution is for State Channels to have built in support for nested State Channels. One channel may therefore contain multiple sub-channels. In an adversarial claim, each of them could be one of the outputs of the settlement or state update, at least if some kind of UTXO model is used for such adversarial outputs. In an account-based system, either the same behavior could apply with new accounts created for each sub-channel as the result of an unchallenged claim, or the claims could be recursively handled with a small gas overhead at each level of nesting.

In the first version of *Chenilles*, we will fully implement support for Nested State Channels in our on-chain contracts.

### Interoperation Between Blockchains

It is possible for State Channel Networks to interoperate with other State Channel Networks on other blockchains. For instance, participant A could send 1 BTC to participant B using a State Channel on Bitcoin, and B could then send 3000 FIL to participant C on Filecoin, or whatever amount corresponds to the mutually agreed upon exchange rate. A and C would presumably pay a fee to B for providing the liquidity, but would otherwise be able to each use their preferred token on their preferred network as part of a same transaction with mutually agreeable amounts. Longer routes are possible across multiple blockchains, but in practice, participants will usually want to minimize the number of expensive currency exchanges along the route.

For interoperability, we will implement on top of *Chenilles* State Channels a HTLC compatible with that of the Bitcoin Lightning Network: the hash function will be the same, the same deadline policy will be used, etc. Then, we will write a program that can simultaneously and coherently drive State Channels on both Laconic and Bitcoin, thus achieving transfers across blockchains. We will then demonstrate HTLC payments from BTC to FiL and back, using the Network as a single centralized intermediary that has both kinds of State Channels (assuming it acquires BTC through some other means). Eventually, we will implement full integration of the Bitcoin Lightning Network and a full Ethereum Lightning Network.

In the first version of *Chenilles*, however, we will not work on interoperation between State Channel Networks.

### Open vs Closed Interactions

Many Blockchains, after Ethereum, allow for arbitrary “smart contracts” to be written, binding their participants to follow any algorithmically verifiable rules as they interact with each other. These “smart contracts” enable participants to interact with each other in a way that *aligns their interests*—they are in many ways similar to legal contracts, but they are cheaper, faster and more predictable, though also more limited and more rigid.

We can distinguish between two kinds of interactions that can be mediated by a smart contract: open vs closed. A closed interaction takes place between a small finite number of participants who are all interested in the interaction making progress. An asset swap, a futures contract, a multisig contract, an inheritance contract, are closed interactions. An open interaction is one that isn’t closed: it can involve a changing set of participants; some may become interested after the interaction started and join; some may leave and cease to be interested in the interaction. A fungible token contract, a DAO, a yield farming contract, an AMM, are open interactions.

Often, an open interaction can be divided into many closed interactions connected by a part that is resolutely open. For example, an auction could be seen as many conditional payments by bidders in case they win in exchange for the auctioned goods—plus the publishing of bids and determination of the winner, which is resolutely open. An exchange order book could similarly be seen as a continuous double-auction that could also be divided in payments and matching.

Generalized State Channels can help scale closed interactions, and the closed interaction parts of larger open interactions. They cannot help with the resolutely open part of open interactions.

In the first version of *Chenilles*, we will include and test minimal contract support for closed interactions conducted over a Generalized State Channel, for future use. We will not implement anything beyond this minimal support, and a fortiori we won’t implement a mix between open and closed interactions.

### Closed Interactions over Generalized State Channels

The state updates of a simple State Channel divide the assets under control between participants in fixed amounts known in advance. For the lightning network, part of these amounts may be subject to a condition ensuring atomicity of transfers (see HTLC above). In a  Generalized State Channel, the state updates can carry arbitrary code and data. Some states clearly indicate that some assets may be claimed by some participants, and an agreed upon algorithm validates which state transitions are allowed for a participant to make even without the cooperation of others.

Thus, for instance, two participants may agree to a future swap contract, according to the price specified by some oracle. When the contract reaches maturity, and even if the other party fails to cooperate, an active participant can use the claim and challenge mechanism: he will reveal the latest state update, that contains the future swap contract; then he will reveal the state transition that executes the swap, given the oracle-provided price at the maturity date; finally he will wait for the end of the challenge period to get his assets out. Or then again, hopefully the other party gets their act together, resumes cooperation, and together they sign a settlement.

Closed interactions over Generalized State Channels embodies the analogy of “code as law”, wherein the blockchain consensus acts like a court system, and a good smart contract binds its signatories but only uses the consensus as a fallback in case something wrong happens. As long as the parties do as prescribed by the contract, the consensus is never invoked, except in the beginning to bind them, at the end to close the contract with a settlement, and potentially with intermediate settlements if any amendments are required. The adversarial part of the contract is only involved if one party (or more) stops cooperating, at which point the interaction becomes slow and onerous—and in the end it’s the party at fault who pays, if identified.

Given a Generalized Lightning Network, two participants could also interact with each other via a number of intermediaries, as long as there is enough collateral for the interaction at each step along the circuit. Special care is required to properly handle adversarial state transitions and collateral in presence of intermediaries.

In the first version of *Chenilles*, we will implement and demonstrate a simple closed interaction over a Generalized State Channel. We will not implement interactions via intermediaries, which would be the topic of a further contract.

### Off-Chain Code

When using State Channels, most of the interaction occurs between participants using their respective off-chain code that runs on their individual computers. In the normal expected case of sustained cooperation, no on-chain contract code is ever invoked, except to open the state channel, close it, and possibly to deposit additional assets into the channel or withdraw assets from it through mutually agreed partial settlements. The participants’ off-chain code is also what drives the posting or non-posting of on-chain transactions when it is necessary for a participant to either make a claim or challenge a claim.

Off-chain code is essential for the proper operation of State Channels. It is also essential that the behavior of the off-chain code should exactly match the behavior of the on-chain code—otherwise, one or both of the participants is liable to lose their assets. Yet, the on-chain and off-chain code are typically written in totally different languages (e.g. JavaScript for off-chain code vs a special variant of Rust for on-chain code), and the off-chain code often needs several subtly different versions (different versions for each participant, different versions for the cooperative and adversarial cases, sometimes different versions for the UI and the underlying server or watchtower, etc.). Writing all the versions of the code consistently is no small challenge, especially when Generalized State Channels are involved, that can include arbitrarily complex logic that must be exactly matched in all those different versions, and remain in sync when the software evolves. To keep Generalized State Channels software manageable, it is recommended that developers should use a Domain Specific Language (DSL) that can coherently generate all the different matching variants of the code from a single specification.

In the first version of *Chenilles*, we will only write off-chain code for the base cases that we demonstrate: payment, payment through one intermediary, payment in nested channels, and the simple closed interaction we choose. We will not be writing more general off-chain code to handle a complete Filecoin Lightning Network, and especially not be writing a DSL compiler targeting Generalized State Channels, though these could be the topic of future projects.

### Interaction Persistence

State Channels are *active* or “hot” rather than *passive* or “cold”, in that each participant must continuously run some service that will cooperate with other participants to complete in a timely fashion transactions that can be initiated by either side at any moment. Thus you cannot start a State Channel and forget about it.

As previously mentioned you can still delegate to a third party called a “Watch Tower” the posting of the latest state of a state channel, such that the other participants cannot steal tokens from you by initiating a non-cooperative exit with an older state while you are unable to actively participate. However, inasmuch as your private keys are required to actively participate in issuing new states, you cannot delegate active participation without trusting a third party with your keys.

Therefore, each participant must make sure *persist* the state of each interaction that he is part of, even in case his computer or data center crashes or is stolen or destroyed. Otherwise, they run the risk of losing any asset they have at stake in an active interaction on a State Channels. For instance, if they are playing poker and lose their interaction state, the other participant will successfully claim that they folded and collect the table stakes.

Persistence of interactions requires participants to commit any new state of all their asset-managing processes to encrypted remote replicas *before* they publish signatures of that state to other participants.

In the first version of *Chenilles*, we will implement just the minimum amount of persistence required, saving data to a local database, without remote replication, and only for the simple interactions that we initially support. In further versions of *Chenilles*, we will implement more elaborate persistence, with remote copies (e.g. using IPFS), and for a generalized class of interactions supporting arbitrary smart contracts.

### Fooey


Indeed, all the participants in a State Channel have to sign each and every state update. Whenever one participant stops cooperating, for whatever reason (accidental or adversarial, technical or legal, physical or virtual, etc.), all the other participants will waste time and have their capital immobilized while they exercise the adversarial claim and challenge option to expel the non-cooperating participant. In the worst case scenario, if multiple participants stop cooperating, the remaining participants will have to go through the claim and challenge process once per non-cooperating participant. This quickly becomes onerous as the number of participants grows.

A circuit involving the same N participants can, using sophisticated interlocking contracts at each channel, manage complex interactions. However, a channel with N participants is faster and more capital efficient; it allows transfers of assets not possible with circuits, and in particular, unlike circuits, it supports non-fungible tokens. A channel with N participants requires no additional trust assumption compared to a circuit with the same participants. The only downside is that once an interaction is over, the two-participant channels of a circuit could be re-organized to partake in new circuits, whereas a N-participant channel must be settled when any participant wants out.

In the first version of *Chenilles*, we will only implement a simple interaction between two parties via a single generalized state channel without intermediaries. We will implement neither state channels with more than two participants nor interactions between many participants via a circuit. These more advanced constructions would be the matter for future projects.


### XXX

all the other participants have
to pay fees to make a claim to close their channels and reopen new ones,
their funds being blocked until timeout (for a week),
the associated liquidity thus made unavailable.

In the first version of *Chenilles*, we will implement HTLC support and demonstrate transfer with the Network as a single intermediary. We may decide initially not to implement general support for transfer with many intermediaries, which is not conceptually harder but is more work than necessary for our value demonstration purposes.



(who may control multiple addresses) 
 (that may be hidden in various ways)



that may be more or less expected
to successfully do its job, where each State Channel is an arc joining two nodes,
where the current state of each State Channel describes the capacity of the arc in each direction, and each direction of each arc has a documented fee structure, well-known algorithms can find an optimal circuit or set of circuits to transfer a given amount from point A to point B while minimizing fees, maximizing expectation of success, or any given performance metric. Now, how is this map to be obtained, to begin with? Some service discovery mechanism is required. Then there are questions regarding how to keep this map up-to-date, how to avoid bad actors from poisoning the dataset, or from spying on the participants, how to maintain privacy with a routing algorithm that requires less of a map or one that reveals less data, etc.

The Bitcoin Lightning Network has answers to all these questions. These answers could probably be largely reused for an Ethereum Lightning Network, with some small adaptations. But to demonstrate as much value as possible with as little upfront investment as possible, we can restrict ourselves to a solution that works in the simplest of cases: payment through a single centralized intermediary. The sender and recipient can simply tell each other which of many intermediaries they support, in decreasing order of preference, until they find a suitable one; then they initiate a payment using this single intermediary. A network where every participant is connected to the same intermediary is called a “hub and spokes” network in reference to a bicycle wheel.

In the very first version of *Chenilles*, we will only implement routing in a very simple hub-and-spokes network with a single centralized intermediary. We will implement neither decentralized discovery of a network nor general routing in an arbitrary network: they are neither conceptually novel nor specific to Filecoin, and are thus unnecessary for our value demonstration purposes.



XXX
We will start by only offering a simple hand-written demonstration of one simple contract on top of our infrastructure, to illustrate an application that is possible with (Generalized) State Channels on Filecoin, but impossible on Bitcoin. Later on, we will develop a complete, safe and affordable programming environment for contracts on top of our Generalized State Channel infrastructure.

At that point, parties who already know each other and their intermediaries can make payments. To complete the *Chenilles* Network, we need a protocol whereby parties can find the intermediaries for their transactions. Happily, we can build upon the work already done by the Bitcoin Lightning Network. Unhappily, a lot of that work is Bitcoin-specific and will have to be ported or generalized, enhanced or fixed, to work with Filecoin and *Chenilles*. We will build:

Even then, there are a lot of features that Filecoin may or may not want to fund as part of the third and fourth stages of development, and we will negotiate the precise feature set that Filecoin is willing to fund before we reach the point of implementing each feature.
