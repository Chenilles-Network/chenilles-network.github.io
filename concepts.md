---
Date:	May 2023 (Latest update August 21st 2023)
URL:	https://chenilles-network.github.io/concepts.html
Author:	François-René Rideau <f@mukn.com>
Company:	Mutual Knowledge Systems, Inc. <https://mukn.com>
Address:	218 NW 24th Street, 2nd Floor, Miami FL 33127
---
# Concepts Underlying the *Chenilles* Network

In this document, we expound the technical and economic concepts
underlying the *Chenilles* Network,
and explain how its Generalized State Channels work.

  - [State Channels: Safe, Scalable, Private Payments](#state-channels:-safe,-scalable,-private-payments)
    - [State Channels](#state-channels)
    - [Layer 2](#layer-2)
    - [Trust Assumptions](#trust-assumptions)
    - [Number of Participants](#number-of-participants)
    - [Assets Under Control](#assets-under-control)
    - [Opportunity Costs of State Channels](#opportunity-costs-of-state-channels)
    - [How a State Channel Works](#how-a-state-channel-works)
    - [Watching the Blockchain vs One-Way State-Channels](#watching-the-blockchain-vs-one-way-state-channels)
    - [Scaling Transactions](#scaling-transactions)
    - [More Than Two Participants](#more-than-two-participants)
    - [State Channels are Side-Chains](#state-channels-are-side-chains)
    - [Extra Privacy through Extra Cryptography](#extra-privacy-through-extra-cryptography)
  - [State Channels Networks: Payments At Scale](#state-channels-networks:-payments-at-scale)
    - [Payment Routes](#payment-routes)
    - [An Overlay Network above a Blockchain](#an-overlay-network-above-a-blockchain)
    - [Transaction Fees, Intermediaries and End-Users](#transaction-fees,-intermediaries-and-end-users)
    - [Payment Atomicity](#payment-atomicity)
    - [Interrupted Routes](#interrupted-routes)
    - [Mitigations for Route Interruptions](#mitigations-for-route-interruptions)
    - [Payment Routing](#payment-routing)
    - [Mapping the Network](#mapping-the-network)
  - [Generalized State Channels: Beyond Single-Blockchain Payments](#generalized-state-channels:-beyond-single-blockchain-payments)
    - [Extending and Embracing Previous State Channels Networks](#extending-and-embracing-previous-state-channels-networks)
    - [Smart Contracts on State Channels](#smart-contracts-on-state-channels)
    - [The Challenge of Exactly Matching Code](#the-challenge-of-exactly-matching-code)
    - [Code Generation to the Rescue](#code-generation-to-the-rescue)
    - [Token Swaps with or without Trusted Third Parties](#token-swaps-with-or-without-trusted-third-parties)
    - [Cross-Currency Network Payments](#cross-currency-network-payments)
    - [Cross-Chain Network Payments](#cross-chain-network-payments)
    - [Embracing and Extending Existing State Channel Network](#embracing-and-extending-existing-state-channel-network)
  - [System Robustness](#system-robustness)
    - [“Non-Functional” Aspects of Software](#“non-functional”-aspects-of-software)
    - [System Security](#system-security)
  - [Additional Links](#additional-links)
    - [The Bitcoin Lightning Network](#the-bitcoin-lightning-network)
    - [Other notable State Channel Networks](#other-notable-state-channel-networks)

## State Channels: Safe, Scalable, Private Payments

### State Channels

A State Channel is a protocol enabling the
fast, affordable, safe and private exchange of assets
between two participants (or possibly more, see below).

A State Channel Network enables the
fast, affordable, safe and private exchange of assets
by routing them from one participant to the next along a path in the Network.

State Channels were invented in 2015 by Joseph Poon and Thaddeus Dryja
as the basic block of the Bitcoin Lightning Network,
a way to scale Bitcoin transactions without sacrificing any security.

### Layer 2

A State Channel is structured as a “Layer 2” protocol,
layered on top of a “Layer 1” blockchain.
Its behavior regulated by a “smart contract” running on said blockchain;
but most of the protocol actually happens “off-chain”,
directly between the participants, outside of the blockchain proper.

The Layer 1, i.e. posting transactions directly on the blockchain,
is always simpler and safer than any Layer 2.
But the Layer 2 of State Channels allows for more transactions,
cheaper, faster, and more privately, than is possible on the Layer 1;
and if done right, it will still be safe.

Note that while Bitcoin does not support general-purpose smart contracts,
State Channels only require extremely simple smart contracts,
and the Bitcoin Script was specially extended to support them.

### Trust Assumptions

Remarkably, using a State Channel to make payments
does not require any trust assumption for safety beside:

  * trusting the underlying Blockchain, and
  * trusting one’s own computing infrastructure.

Both of these assumptions are already prerequisites
for exchanging digital assets on that Blockchain,
so that State Channels do require to extend the trust assumptions needed
to safely transact blockchain-managed assets.

The participants in a State Channel do not need to trust each other
to ensure the safety of the funds under control of the State Channel.
However, they do need to trust each other to maintain an active and regular
presence on the network and answer each other’s requests in a timely fashion to
ensure the _liveliness_ of the State Channel and the speed of its transactions.
Now participants also need to personally maintain their own presence
on the network to ensure the safety of their own assets
if they are on the receiving side of transactions.
State Channels are therefore not suitable for every use by every user.

### Number of Participants

A State Channel only works between a relatively small set
of agreeing participants, determined in advance.
Most, maybe all, current State Channel systems,
including the Bitcoin Lightning Network,
only support two participants in a given channel.

In theory State Channels could support any number of participants,
as long as they are all available online to complete transactions.
For this reason, only professionals and serious amateurs
may participate in such large State Channels, and even then,
the State Channel probably cannot have more than a few tens of participants.

Network payments (see below) enable transfer between participants
in the overall Network who are only indirectly connected with each other,
even though each individual State Channel only connects two participants.
Having more than two participants in a State Channel can thus
be more capital-efficient, but isn’t necessary for payment operations.

### Assets Under Control

A State Channel requires its participants to put under the control
of its smart contract the assets that they want to be able to exchange.
These assets must thus be managed by the Layer 1 blockchain
on which this smart contract is registered.

The Layer 1 fees associated with operating a State Channel do not increase
with the amount of assets deposited into the State Channel
(see below however regarding Opportunity Costs).
There are no Layer 1 fees associated with making transactions
on a State Channel, since they all happen “off-chain”.
A State Channel can therefore handle arbitrary large assets,
and an arbitrary large number of transactions on those assets,
at a very effective cost.
However the fixed costs will make State Channels impractical
when the _total_ assets are too small—yet even then not more impractical
than the Layer 1 blockchain itself.

### Opportunity Costs of State Channels

The assets in a State Channel are locked until the State Channel is closed
and are not available for other uses by the participants.
There is thus an opportunity cost to putting assets in a State Channel
rather than putting it to other uses.
This cost only increases with the risk that (one of) the other participant(s)
stops cooperating and the assets then remain locked during an additional
exit challenge period (see below).

Liquidity providers may thus be hesitant to place (too much of) their funds
in state channels, especially with other participants they don’t trust
to keep cooperating and/or do not possess a good reputation, track record,
or off-chain identity that can be sued or retaliated against.
This cost and this risk will then be priced into the cost
of operating State Channels.
For some applications (e.g. high speed trading on a non-custodial DEX),
some participants, especially anonymous ones or new entrants,
may find that they have to pay the other party to rent out their liquidity,
and may have to make a security deposit to cover the risk
of their failing to cooperate.

### How a State Channel Works

A two-participant State Channel works as follows:

  - Two participants put digital assets in a common contract
    that enforces the rules below.

  - The two participants communicate off-chain to prepare and both sign
    “state updates” (details below) about
    who would own how much of these assets should the channel be closed
    (the initial state is based on which participant deposited which assets).

  - The two participants do *not* post these state updates on the blockchain,
    but rather keep them in private, off-chain,
    until one or both of them wants to close the channel, or rebalance it
    (add or remove assets from it).

  - Instead, when one participant wants to close or rebalance the channel,
    they both sign a *settlement* transaction,
    based on the latest state update, that enacts it.

  - If the other participant refuses to cooperate in creating this settlement,
    or is unable to, the active participant who wants to settle
    may initiate a *non-cooperative exit*:
    they will issue a claim based on the latest mutually signed state update,
    and challenge the other participant to disprove that claim.

  - If the claim goes unchallenged, then after a timeout,
    the claimant can take their tokens as per the claimed state update.
    (Timeouts are one week on the Lightning Network.)

  - As a response to the claim, the other participant may cooperate
    and sign a settlement that overrides the challenge, or may post
    their own more recent state update that overrides the previous one.

A “state update” is thus a transaction for a non-cooperative exit,
signed by both participants, but not posted on the blockchain,
instead kept private until needed, if ever. That transaction itself contains
the transaction distributing the State Channel assets
according to the current state, but only after validation through a challenge.

### Watching the Blockchain vs One-Way State-Channels

As long as your computer can watch the blockchain
for a possible adversarial claim with an old unfavorable state update
and successfully challenge it on time, you can be sure that
you control any assets assigned to you in the latest state update.
There are even “watchtower” services that for a small fee
will watch the blockchain for you and make sure no claim
based on such a unfavorable old state update will go unchallenged.

If you fail to watch the blockchain for challenges,
and if all the “watchtower” services you hire fail you,
then the other participant may post then validate a claim using
an out-of-date state update in which they owned a larger share
of the assets under State Channel control.
They may thus “travel back in time” to “roll back”
a contiguous set of the latest transactions,
possibly all the way back to the initial state of the State Channel,
to undo them, to their advantage and your disadvantage
if the total balance of these transactions was in your favor.

In particular there is no risk to you
if all you did since channel creation was spend;
if you mostly spend but occasionally receive small amounts
then the risk is limited to how much you recently received.
An “end-user” having a one-way State Channel for payments only can thus
skip the watching of the blockchain.

Now, if you receive significant assets through the State Channel,
whether you are on the receiving side of a One-Way State Channel,
or are a participant in a State Channel that sees traffic both ways,
then you must make sure to be watch the blockchain carefully.
You should have multiple watchtowers, either in-house or hired contractors,
in remote redundant data centers, to do the job should your main systems
come to crumble under attack or otherwise fail.

### Scaling Transactions

Making a state update only requires two signatures off-chain in private;
thus it can be extremely fast and doesn’t require the payment
of expensive fees to the Blockchain validation network.
Furthermore, it can cover any number of
(so far unconfirmed) intermediate transactions since the previous state update.
Transactions can thus be issued even faster with a high throughput
(though with the latency floor of this signing process).

Given the available capacity, the two participants may thus efficiently trade
in very small amounts below what is affordable to transact
directly on the Layer 1 blockchain.
They may even maintain private accounting in fractions of such amounts,
as long as they can agree on a rounding
for the amounts appearing in the state updates and settlements.

### More Than Two Participants

A State Channel can actually have more than two participants,
though two is the common case, and the only one supported by
the Bitcoin Lightning Network and its copycats.

The way to extend the protocol for three or more participants is that
every state update must be signed unanimously by all the participants.
This preserves the essential safety property of State Channels,
but it means that any single participant may break the unanimity
and cause the other participants to have to issue a challenge to exit the State Channel.

One minor issue is that there might not be a non-gameable yet affordable way
to enforce rules ensuring fairness regarding who shall pay the
(limited but more than zero) blockchain fees
to publish the challenge transaction and (after timeout) the following
resolution transaction that will non-cooperatively close the State Channel.
Nevertheless, the remaining participants may want as a courtesy to reimburse
whichever participant ends up footing the bill, for instance as a transaction
on a successor State Channel that they agree to create with each other,
excluding the participant(s) that stopped cooperating.

But the more limiting issue is that the more participants are added
to a State Channel, the higher the latency of the multisig algorithm
that handles the unanimity-based consensus between between participants.
Also, the more participants are added to a State Channel,
the higher the risk that one of them at some time will eventually become
unable or unwilling to cooperate,
leaving the others to use the non-cooperative exit
while their funds are locked for the duration of a challenge.

State Channels with more than two participants should thus be done only
by dedicated people, whether professionals or enlightened amateur,
who generally trust each other with keeping their systems
online and available for other participants to interact with and sign transactions.
Definitely not something to do with random anonymous people with no reputation.
And even then, only a few tens of them, possibly a few hundred,
may feasibly partake in the protocol before it becomes horribly inefficient.

### State Channels are Side-Chains

One way to think of State Channels is as “Side-Chains”, Layer 2 blockchains
that manipulate tokens rooted on a Layer 1 “Main (block)chain”.
Unlike most side-chains, though, State Channels do not use
Proof-of-Stake, Proof-of-Work, Proof-of-Authority or any such consensus
algorithm involving new trust assumptions based on cryptoeconomics
(or worse, a centralized operator).
Instead, State Channels use unanimity between participants
as their consensus algorithm, which is both much simpler and much safer,
with the downside that it doesn’t scale to as many participants (see above).

Thinking of State Channels as Side-Chains also lets you realize that
State Channels could have all the same kind of smart contracts
as their Main Chain, with the restriction that for the sake of safety
the set of participants in one of these contracts must be a subset
of the set of participants in the State Channel.

Now, one obvious kind of contract possible in a State Channel is
another nested State Channel contract,
one between such a subset of participants,
such that they may transact faster and more privately between each other
than they could with the complete set of participants.
Or merely a way to handle a lot of simultaneous transactions in parallel
between two (or more) participants. Thus, transactions do not have to wait
for other transactions to complete before they start; and, by recursively
nesting State Channels, the participants can handle more such sub-transactions
in progress than would fit in a single Layer 1 super-transaction.

### Extra Privacy through Extra Cryptography

Since participants must all be online for a transaction to work,
it is also practical to use some interactive signing protocol that generates
a regular ECDSA signature, making it indistinguishable from a regular signature.
Then the very existence of a State channel becomes invisible to onlookers:
creating a State Channel looks like sending tokens to a regular address,
and settling a State Channel looks like a regular address sending tokens.

Only in the exceptional situation when the unanimity breaks down,
does the challenge transaction reveal that the address had been a State Channel.
Even then, on blockchains that support zk-SNARKs, this challenge transaction
can be made undistinguishable from any other zk-SNARK based contract invocation.

## State Channels Networks: Payments At Scale

### Payment Routes

Given a series of participant, such that each participant has a State Channel
open with the next participant (except for the last participant, for which
there is no next participant), it is possible for the first participant to send
tokens to the last participant by passing them from one participant to the next
through those State Channels.

For instance, participant A sends 5 tokens to participant B, who sends 5 tokens
to participant C, etc., until participant Y sends the 5 tokens to participant Z.
As long as tokens are fungible, and there is a “route” of channels from A to Z,
through a series of willing intermediaries, each channel having sufficient
capacity to cover the tokens being sent in the correct direction,
then a transfer is possible.

Of course, there are some issues with intermediaries: How to prevent them from
just keep the tokens after they receive them, or how to reassure them that they
can send the tokens before they receive them? With suitable smart contracts.
How to incentivize them to participate in the payment at all? With usage fees.
There are technical solutions to these issues that we will discuss below.

Once these issues solved, these “payment routes” enable fast, cheap and private
transactions from one State Channel participant to another, as long as
a suitable route of State Channels can be found between them.
A State Channel thus enables more than just direct payments between its direct
participants; it potentially enables indirect payments between all participants
of all State Channels on a blockchain—and, we’ll see, beyond.

### An Overlay Network above a Blockchain

Now we may consider all the State Channels on a Blockchain as
the arcs of a graph, of which the Participants are the nodes.
This graph constitutes a Network that enables payments along any route
in the network wherein each arc has sufficient capacity in the given direction.
This State Channel Network is thus an Overlay Network (Layer 2)
on top of the underlying Blockchain (Layer 1).

Interestingly, Layer 2 participants can but need not be participants
in the Layer 1 network as miners or nodes or owners of UTXO.
Instead, the State Channels, that are arcs of the Layer 2 Network,
appear on the Layer 1 as UTXOs the lock scripts of which are akin
to Layer 1 Network participants.

The two Networks are thus quite distinct and separate,
though they are related via the deposits and withdrawals that are
State Channel creation and destruction.

### Transaction Fees, Intermediaries and End-Users

The costs involved in a Network Payment are tiny.
Each intermediary may charge a fee to cover their part,
yet the fees may be small enough that even after adding all the fees
from all the intermediaries, the overall Payment will still be
much cheaper than a direct transaction on the underlying Layer 1 blockchain.

Specialized intermediaries may thus profitably maintain many State Channels open
with plenty of end-users and multiple other such specialized intermediaries,
providing a “hub” in the Network, and charging a small fee at each transaction,
negotiated as per as well-determined Network rules.
The graph of those intermediaries constitutes the core of the Network.

By contrast, at the edge of the Network, many end-users may be participants with
only a single State Channel open, with a specialized intermediary,
who serves as their entry hub into the Network.
They may even use their State Channel One-Way for payments only, or mostly so,
and not bother being active participants or watching the blockchain.

Meanwhile, other State Channels may exist between participants who are not
connected to the rest of the Network and will not advertise their presence.
Instead they will exchange tokens privately in their own secret network,
sometimes reduced to a single State Channel.
They can set and follow their own rules for transaction fees or lack thereof.

### Payment Atomicity

To prevent intermediaries either cheating or being cheated,
each intermediate transaction along the route will be made conditional
on some triggering event, such that either all transfers happen,
or none of them do—a property known as “atomicity”.

Thus, no intermediary may run away with the tokens he received
while failing to send the agreed upon tokens, or in the opposite case,
be left with an unfulfilled IOU after sending the agreed upon tokens.

Bitcoin uses a “HTLC” for that (Hash Time-Lock Contract):
the parties commit to a hash and a deadline, such that
if the preimage to the hash is revealed before the deadline,
the transfers happen, but if it isn’t, the transfer is canceled.
Once all intermediaries along the way have signed their respective commitments,
the preimage is revealed.

To avoid attacks that lead to
some participants losing due to a partial transfer, it is important
for parties to sign in the correct order,
for the deadlines of the respective commitments to be properly staggered,
for these deadlines to interact well with the deadlines
for the regular challenge mechanism, etc.
Proper implementation of payment atomicity is tricky,
but can be done and has been done in the past
by the Bitcoin Lightning Network at least.

### Interrupted Routes

One risk with Network Payments is that some participant along a route
stops cooperating mid-transaction.
Then, everyone else following along the route would remain uncertain about
whether the transaction is going to be completed or canceled.
The liquidity they had set aside for what ought to have been a nearly
instantaneous transaction, a fraction of a second, or a few seconds at most,
may now be locked in limbo for weeks, pending the transaction timing out.

The worst participant to fail would be the initiator;
but in an even worse scenario, a cascade of intermediaries each fail
at the last possible minute, causing all the timeouts to add up for
the last person at the end of the transfer.
The overall timeout would comprise the duration of a non-cooperative exit
challenge followed by a preimage publishing challenge, followed by further
such timeouts in a cascade for all the potentially failing intermediaries
along the way.
Depending on the details of the HTLC protocol in use,
this could be many weeks instead of a fraction of a second.
A potentially huge opportunity cost.

The risk of interruptions further increases as the routes get longer and
involve participants who weren’t vetted for their good behavior.

### Mitigations for Route Interruptions

To offset this risk reputable intermediaries may refuse to partake
in routes involving distrusted participants, or may charge extra fees.
To compensate them for making their liquidity available, they may also
charge rent in advance for the expected worst case timeout duration,
and reimburse the unused rent after the transaction is confirmed
in a timely fashion. The reimbursement may be impossible to forcibly recoup
if the intermediary doesn’t cooperate, but failure to cooperate would be
grounds for being blacklisted from future transactions
with the other participants, and the culprit would grow a bad reputation.

Another mitigation strategy might be to always split up large payments
into smaller payments that involve less liquidity being locked in limbo
for a long time, the rest of the liquidity only being locked for a single
regular challenge duration.
As the size of individual payments decreases, this strategy will lead to
less liquidity rental interests but more fixed transfer fees.

More capable chains may use improved mechanisms compared with Bitcoin's HTLC
to minimize the window during which transactions are unconfirmed
(more on this later).

### Payment Routing

Network payments allow for safe transfer of tokens across a circuit with
well-identified cooperating participants each possessing suitable assets
in their respective consecutive State Channels.
But how is this circuit to be established to begin with?

The State Channel Network may be seen as a graph,
where each participant is a node, and each State Channel is an arc.
Given a good “map” of the Network containing every node and arc,
with limit capacities and operation costs for each arc,
many well-known simple graph algorithms to find the “best” route(s)
to send tokens between two participants, for any metric for route:
lowest cost, lowest latency, lowest risk estimates,
any weighted combination of the above, etc.

The main issues are then to obtain an up-to-date map of the Network,
but also importantly to correctly estimate the risk that any given
participant may stop cooperating in the future.

### Mapping the Network

If the network were fast enough to advertise changes in real time,
if no one cared about privacy,
if all the network participants were completely honest at all times,
then it would be easy to gather a truthful map of the network
based on which to make the best routing decisions.
Unhappily, such is not the case.

The gossip network on which participants and channels are advertised
can be slower than the network changes: indeed phase of every transaction
causes the capacity of one or several network arcs to change,
so the more people use the network, the faster it changes,
and it doesn't make sense to send precise updates in real time.
Moreover, a big reason why many people want to use blockchains
is for privacy, and so they won't want to publish exact capacity updates
at every transaction, for that would make off-chain transactions
easier to follow in addition to wasting a lot of bandwidth.
Participants would thus signal some very approximate liquidity availability,
and would only publish updates when significant changes happen —
akin to how airlines advertise seat availability to each other.

Now, vandals might publish random false information that disrupts the Network,
whether for interested reasons (propping up a rival network,
centralized or decentralized, government or private),
for the Schadenfreude (cheaply wasting other people's time),
or out of sheer incompetence and irresponsibility.
Some system of reputation and vetting is required to fend off the vandals.
Yet any fully automated public reputation system is subject to gaming,
so it is likely that some any actual solution will be dynamic and evolving,
partly manual, partly secret, somewhat decentralized system, and yet
possibly reusing centralized systems
(and optionally using zk proofs to preserve privacy).

Thus, in practice, the Network map is somewhat unreliable, and
there is no guaranteed way of measuring whether a route will work
except to try to use it and see if it succeeds.
A transfer may involve many failed attempts before a working route is found.

## Generalized State Channels: Beyond Single-Blockchain Payments

### Extending and Embracing Previous State Channels Networks

So far the concepts we have explained are those underlying all State Channels,
including the Bitcoin Lightning Network and its many copycats
on other blockchains.
But better more powerful State Channels are possible, that have been imagined
already, though none have been successfully implemented so far.
Let us now explain the concepts behind these Generalized State Channels:
how State Channels can be extended to effectively support Smart Contracts,
and with them, to enable asset swaps, payments across currencies,
payments across blockchains, self-custodial decentralized exchanges,
and much more.

### Smart Contracts on State Channels

On Ethereum and other smart-contract capable blockchains
State Channels can be used not merely for payments,
but also for arbitrary conditional interactions between participants—be it
a futures contract, an auction, a poker game, etc.
State Channels with such functionality are called “Generalized State Channels”.

Smart-contract capable blockchains include Ethereum, and after it
Cardano, Solana, PolkaDot, Avalanche, Cosmos, Filecoin, Internet Computer,
Aptos, Algorand, Tezos, MINA, Nervos,
and their respective forks and clones (list not exhaustive).
But they emphatically do not (as of 2023 at least) include
Bitcoin, Ripple, Monero, Stellar, Zcash,
and their respective forks and clones (list not exhaustive).

It is quite easy on smart-contract capable blockchains
to modify the basic State Channel infrastructure
to accept Generalized State Channels—and
much cheaper to add this functionality earlier than later.
Thus we propose that any future State Channels should indeed be
Generalized State Channels from the get go.

### Concurrent Transactions

Most existing State Channels only support one interaction at once.
When the only interactions are one-way payments
that are meant to be completed very fast,
as in the Bitcoin Lightning Network, this might be good enough.
Even then, it can cause a lot of liquidity to become unavailable
when a payment suddenly fails and one or multiple channels
undergo non-cooperative exits.
Now, when handling transactions that are not all supposed to complete very fast
it becomes wasteful to lock the entire channel liquidity while waiting for each
small transaction to complete.

The solution is Concurrent Transactions:
a State Channel can handle multiple transactions at a time, each
in a separate UTXO, as specified in the State Channel's latest state update.
Each UTXO needs only lock the assets involved in its ongoing transaction
with a lock script specifying the transaction logic.
The unlocked balance can be assigned to each participant in UTXOs
unconditionally assigned to the participant’s public key.

The number of concurrent transactions specified in a state update is limited
by the size or gas limits of the blockchain, that will constrain the total
size or gas required to execute the state update.
Care must be taken to reserve space for the worst case size that
each concurrent transaction may take during its lifetime, and not just
whether the current state of these transactions fits within the limits.

And yet, by having some UTXO themselves commit to the disbursement of their
assets to multiple further UTXOs, any number of concurrent transactions
can be handled through nested concurrent transactions.
There are however two limits to this nesting:
First, the deeper a transaction is nested,
the longer the overall delay involved in unwinding it,
since that will require a number of consecutive transactions.
Second, the number of supported nested transactions grows exponentially with
the depth of the nesting, but the Layer 1 blockchain has a limited capacity
to support those transactions.
Therefore, there is no point in nesting transactions past a small depth limit.
In the end, the Layer 1 scaling limitations constrain the allowed complexity
of Layer 2 transactions.

Note that Concurrent Transactions do not require the Layer 1 blockchain
to support arbitrary smart contracts, only the ability for a transaction
to have more than two UTXOs, which exists even on Bitcoin.
They are nevertheless a generalization compared to what previous State Channels
otherwise allowed:
despite it being a conceptually simple extension, it requires more elaborate
software architecture than that used for the simple previous State Channels.

### Nested State Channels

With Concurrent Transactions, a State Channel state update can specify
many arbitrary UTXOs, including new, nested, State Channels.
Nested State Channels allow for a subset of the State Channel's participants
to have their own faster and more private set of transactions that the other
participants cannot see.
Such Nested State Channels are faster, more private, and more capital-efficient
than starting a new State Channel directly on the Layer 1 Blockchain.
They are only useful when the (outer) State Channel
has more than two participants.

As a downside, the non-cooperative delays of the outer and inner State Channels
add up, since the inner State Channel’s non-cooperative exit process
can only start after its UTXO was activated, which only happens after
the outer State Channel’s non-cooperative exit process is complete.
Care must be taken to account for this increased delay when using time-locks
such as in HTLC payment routes.

### Open vs Closed Interactions

Smart-Contract-capable Blockchains, after Ethereum, allow for arbitrary
“smart contracts” to be written, binding their participants to follow
any algorithmically verifiable rules as they interact with each other.
These “smart contracts” enable participants to interact with each other
in a way that *aligns their interests*: they are in many ways similar to
legal contracts, but they are cheaper, faster and more predictable,
though also more rigid, and limited to topics that tolerate this rigidity.

We can distinguish between two kinds of interactions that can be mediated by a
smart contract: open vs closed. A closed interaction takes place between a
small finite number of participants who are all interested in the interaction
making progress. A payment, an asset swap, a futures contract, a multisig, an
inheritance contract, are closed interactions. An open interaction is one that
isn’t closed: it can involve a changing set of participants; some may become
interested after the interaction started and join; some may leave and cease to
be interested in the interaction. A fungible token contract, a DAO, a yield
farming contract, an AMM, an order book, are open interactions.

Often, an open interaction can be divided into many closed interactions
connected by a part that is resolutely open. For example, an auction could be
seen as many conditional payments by bidders in case they win in exchange for
the auctioned goods—plus the publishing of bids that may or may not be open,
and determination of the winner, which is resolutely open.
An exchange order book could similarly be seen as a continuous double-auction
that could also be divided in private payments and public matching.

Generalized State Channels can help scale closed interactions, and the closed
interaction parts of larger open interactions. They cannot directly help with
the resolutely open part of open interactions, but they can help keep these
parts minimal. For instance, the public part of an auction could be reduced
to cheaply publishing on a rollup a 32-byte witness that identifies the winner,
whereas the bids all happen privately off-chain via State Channels.

### Closed Interactions over Generalized State Channels

The state updates of a simple State Channel divide the assets under control
between participants in fixed amounts known in advance. For payment routes,
part of these amounts may be subject to a condition that ensures atomicity.
In a Generalized State Channel, the state updates can carry arbitrary code
and data in as many independent UTXOs as there are independent transactions.
Some states indicate that some assets may be claimed by some participants, and
an agreed upon algorithm validates which state transitions are allowed for
each participant to make even without the cooperation of others.

Thus, for instance, two participants may agree to a future swap contract,
according to the price specified by some oracle.
When the contract reaches maturity, and even if the other party fails to
cooperate, an active participant can use the non-cooperative exit mechanism:

  - He will reveal the latest state update,
    that contains the future swap contract.
  - After the challenge delay, the state will be validated, the State Channel
    assets will be distributed as per the set of UTXOs specified,
    among which one for the future swap contract that will thus be activated.
  - He will then invoke the future swap contract with a state transition that
    executes the swap, given the oracle-provided price at the maturity date.

Or then again, hopefully the other participant gets their act together,
resumes cooperation, and together they sign a settlement.

### Generalized State Channels Embody “Code As Law”

Closed interactions over Generalized State Channels embody the analogy of
“code as law”, wherein the blockchain consensus acts like a court system,
and a good smart contract binds its signatories but only uses the consensus
as an expensive fallback in case something wrong happens.
As long as the parties do as prescribed by the contract,
the consensus is never invoked, except as a rubber stamp,
in the beginning to bind them,
at the end to close the contract with a settlement, and potentially
in the middle for intermediate settlements when amendments are required.
The adversarial part of the contract is only involved if one party
(or more) stops cooperating, at which point the interaction becomes slow and
onerous—and in the end it’s the party at fault who pays,
if it can be identified.

Given a Generalized State Channel Network, two participants could also interact
with each other via a number of intermediaries, as long as there is enough
collateral for the interaction at each step along the circuit, and each
intermediary agrees to propagate each step of the interaction.
Special care is required to properly handle adversarial state transitions
and collateral in presence of intermediaries:
each intermediary must understand the enough of rules of the interaction
to get their assets back in case of dispute.

### On-Chain and Off-Chain Code

When using a Decentralized Application on top of State Channels,
most of the interaction occurs between participants
using their respective off-chain code that runs on their individual computers.
In the normal expected case of sustained cooperation, no on-chain contract code
on the Layer 1 Blockchain is ever invoked for regular Layer 2 transactions.
That’s the entire point of a Layer 2 protocol.
There are still Layer 1 transactions involved in normal operations, but only
to open and close a State Channel, and possibly to deposit additional assets
into the channel or withdraw assets from it, through partial settlements.

Each participant’s off-chain code responsible for all these normal operations,
most of them off-chain. But the off-chain code is also responsible for handling
the abnormal case when cooperation breaks down. It must watch the blockchain
for challenges, and post its own challenges and responses on-chain as required
by the non-cooperative exit process.

The off-chain code can be written in a single piece in a single language,
often JavaScript (JS) or TypeScript (TS).
But it is sometimes split into several pieces in several languages:
for instance, the User Interface (UI) will be written in JS or TS,
or Kotlin or Swift; but a separate semantic layer and network daemon
will be written in a system language, such as Go, Rust or C++.
There may be several different variants of the off-chain code, too,
for each of the very different roles that participants may take in an interaction:
“payer” vs “payee”, “seller” vs “buyer”, “banker” vs “depositor”,
“auctioneer” vs “bidder”, option “putter” vs “caller”, “insurer” vs “insured”,
etc.
And when there are are intermediaries along a route of State Channels,
each intermediary must also follow the actions of the end-participants
on either State Channel and relay them onto the other State Channel,
and possibly take action in case of non-cooperative exit.
That too requires specialized off-chain code.

Meanwhile, the on-chain code can also be written
in a single piece in a single language, or split into several pieces;
for instance public smart contract logic that compiles to the blockchain VM
may be separate from a private semantic piece that compiles to zk-SNARKs.
The public blockchain logic is usually written in Solidity (on Ethereum),
some variant of Rust (that differs wildly between PolkaDot, Solana, or Nervos),
Plutus (on Cardano) or some other very specialized and blockchain-specific
language—indeed on Bitcoin, people often directly use
its Bitcoin Script bytecode virtual machine.
Plenty of new emerging languages specialize in compiling to zk-SNARKs
and may or may not fit in various blockchains with
various matching public smart contract infrastructure on various blockchains.
If the application runs with intermediaries along a graph of State Channels
connecting the actual end-participants, rather than directly in a single
State Channel between these two (or more) participants,
then several variants of the on-chain code may exist for each segment along
the route or routes between participants; and
if such a route crosses blockchain boundaries, then
variants of the on-chain code must be present on different blockchains,
using different languages and virtual machines.

### The Need for Exactly Matching Code

A Decentralized Application running on top of State Channels must thus contain
many pieces of code written in two or more languages,
in many variants both off-chain and on-chain, for many roles,
possibly with intermediaries, possibly for many blockchains.
Now it is of extreme importance that all these different pieces of code
each covering some aspects of the application
should all match each other as well as the participants’ expectations.
And this match must cover not just the big picture during normal operations;
it must be *exact* down to the most minute detail in every possible corner case
of every imaginable interaction between participants and with the blockchain.

Indeed, should there be a mismatch, a dedicated attacker will make sure
to invoke whichever remote corner case exists, to break the application
and elope with other participants’ assets, as many times as possible,
until all participants stop using the broken application and
replace it with a fixed one.
Even then, if the on-chain part of the code is broken, it may be too late
to save the assets already put into the broken application and move them
out to a fixed application or return them to their owners.

One saving grace of State Channels here is that in a Closed Interaction,
only existing participants may cheat or break the application, and
if all of them are honest, then things will go right anyway.
Third party attackers may not break into existing State Channels
(unless the State Channel infrastructure itself is seriously broken).
Yet, if some service-providing participants have an Open Interaction
wherein they automatically accept new service users via State Channels,
then attackers may create new Closed Interaction wherein they may steal assets
using the broken application.

### The Challenge of Exactly Matching Code

Now, getting an exact match between multiple pieces of code
written in different language is extremely hard.
Each language and each piece of code has its own different corner cases,
sometimes subtle, sometimes not so subtle, that requires suitable treatment
when reproducing the behavior in other languages, or extreme caution
to avoid the corner case to begin with so as not to have to reproduce it.
The combinatorics of such corner cases explodes exponentially with the number
of pieces of code and programming languages involved.
And the exploding number of cases to consider only gets worse when each
participant along the way may run their own version of
all the software infrastructure involved (compilers, virtual machines, etc.).

The difficulty is so challenging that it is impossible for programmers
to overcome in practice, writing all that code by hand, except for the
simplest of applications in the simplest of configurations,
on a single blockchain, without intermediaries.
Even when such a feat is achieved, the least modification to the application,
eventually required to combat “bitrot” and adapt to a changing world,
will require matching modifications in all the variants of the code;
and one small local modification in one variant may correspond to
large non-local modifications in other variants.
Maintaining and evolving such code by hand is thus another great challenge.

There is also great difficulty in testing whether you got it right or not.
Indeed, most of the on-chain code is meant never to be run
during the normal operations of the Decentralized Application.
Only in an exceptional situation where cooperation stops will a small bit
of the on-chain code be invoked, a different little bit in each situation.
Testing the on-chain code thus requires careful and systematic testing
of every corner case at every point of partial execution of every interaction.
This is quite unlike any testing that anyone usually writes by hand,
and the set of all these test cases can change a lot with a small change
in the application.

All these difficulties combine into making the task of writing
Smart Contracts over State Channels an extremely complex challenge,
that is not affordably feasible using the current technology.

### Code Generation to the Rescue

With a language such as [*Glow*](https://glow-lang.org),
that from a smart contract specification can simultaneously generate
all perfectly matching on-chain and off-chain code,
that correctly handles all exceptional situations by construction—it
becomes feasible to write smart contracts on State Channels
without crumbling under the difficulty and the complexity.

That is the approach we are taking with the *Chenilles* Network:
we make Smart Contracts feasible on top of State Channels thanks to *Glow*.
Then, we take advantage of these Smart Contracts to enable currency swaps,
oracle-based private stable coins, and any other kind of trades,
including across currency and across blockchains.

See [our whitepaper](https://chenilles-network.github.io/whitepaper.html)
and the earlier [Glow Whitepaper](https://bit.ly/GlowWhitepaper2020).

### Token Swaps with or without Trusted Third Parties

Thanks to Smart Contracts, it becomes possible for State Channels to support
payments from one currency to another. Multiple methods are possible,
each with different advantages and inconvenients:

  1. Participants can agree to amounts in both currencies based on some rate
     determined by consulting off-chain data sources. Then, the participant
     initiating the transfer has a limited time to complete the transaction;
     he inevitably has an implicit option to either complete or fail to.
     This option is priced in the agreed upon rate based on the the time window
     and volatility. Confirmation is achieved by posting of a witness,
     either (i) always (with a short window), or (ii) in a challenge period
     after failure to cooperate within tight bounds (can be cheaper but
     requires managing reputation of the other participant), or (iii) after
     a full exit challenge period plus publishing period (works on Bitcoin
     unlike the other options, but adds so much latency that the volatility
     makes the entire transaction too expensive to be desirable).
     Posting can be done (a) in a blockchain transaction (expensive), (b) in a
     shared rollup transaction (somewhat cheaper but potentially less reliable),
     or (c) on a mutually trusted off-chain data availability engine (cheaper
     and faster, but it requires both participants to trust a third party
     committee).

  2. Participants can agree to an amount in one currency and
     to an Automatic Market Maker (AMM) to use to do the conversion.
     This is safe assuming there is enough liquidity in the AMM
     that it won’t be manipulated into giving a bad rate.

  3. Participants can agree on a mutually trusted Price Oracle to give
     the timestamped rate that will be used within a time window,
     with an automated adjustment for the implicit option as above.
     The Oracle can be called on-line as part of the verifying transaction
     on-chain (if any), or can sign a witness
     off-line that allows for predictable results off-chain as well as on-chain.
     As they initially negociate the terms off-chain, the participants agree on
     how to pay for the implicit option as well as for how much collateral
     should be kept to face on either or both sides to adapt to volatility
     in the exchange rate across the trade window.

Any variant of token swap contract found in the literature or in production
could be used here. What more, no actual on-chain transaction is required
as long as the participants expect each other to keep cooperating, such that
they can afford methods that if verified on-chain would consume a somewhat
higher amount of gas than participants would be willing to afford if they
had to systematically verify.

### Cross-Currency Network Payments

Token swap contracts as above can be modified for
cross-currency Network Payments:
the initiator, after identifying a suitable route including a token exchanger,
creates a series of conditional payment contracts along the route,
and possibly pays transfer fees and an exchange fee.
Then, the intermediaries all commit their complete collateral for the conditional exchange.
The triggering event is confirmed either happening or not happening within a short deadline.
Finally, the chain of interlocked transfers all either happen or are canceled in sequence.

Compared to same-currency network payments, cross-currency network payments
always involve extra fees to cover for volatility.
Furthermore, extra delay for confirmation implies extra volatility hence extra fees.
There are ways around it, but only with extra trust assumption:

  * If the user trusts the reputation of a liquidity provider, the provider can
    demand an advance deposit of a high fee covering the worst case scenario
    where the confirmation takes a long time, and reimburse the deposit
    when the liquidity user completes the transaction very fast.
    There is no way the blockchain can attribute blame when unanimity breaks
    and the two participants point fingers at each other, so one has to trust
    the other not to steal the fee deposit. At least, the principal amount
    being transfered remains safe even if the trust is misplaced.
    A well-identified liquidity provider with a bad reputation
    will lose customers to those with a good reputation.

  * If both parties trust a fast enough data availability engine
    that their blockchain(s) can check, can use it as source of truth for
    whether a transaction is confirmed to have happened.
    On a blockchain like Ethereum, a shared rollup service can be used as
    a somewhat affordable but not particularly fast such
    data availability engine.

  * If both parties trust the signed timestamped quotes of a same Oracle,
    they can commit in advance to the price that will be known after the
    transaction is agreed upon (within the limits of the collateral deposited),
    at which point neither participant can control delay to select a better rate,
    and the price is confirmed quickly. However, the lack of control on
    the exact rate may displease both parties.

### Cross-Chain Network Payments

Once we have Cross-Currency Network Payments,
we can also do Cross-Chain Network Payments:
Cross-Chain Network Payments are “just” network payments
where some State Channels are layered on top on one blockchain
and some layered on top of another.

The key difficulty in Cross-Chain Network Payments is that
the native tokens of one chain is not that of the other, and
the triggering / confirmation events enforceable on one chain
are not usually easy to verify on another chain.
Either or both difficulties can be solved with a *bridge*.
But they can also be solved with a trusted price oracle or
data availability engine that provides signatures verifiable on both chains.

On the other hand, a simple HTLC as used by the Lightning Network will not do,
because its worst case involves too long a delay which compounded with the
volatility of cryptocurrency generates too much friction and high fees.
Still, assuming the participants both trust a same bridge, they can use
the usual HTLC to send bridge-wrapped Bitcoins to a smart contract on
a suitable blockchain (such as Ethereum) as a first transaction,
in a second transaction, the smart contract there can handle the business logic
that couldn’t be expressed on Bitcoin.
This solution, however, supposes that key participants already have
a suitable State Channel open on the other Network, or is willing to create one,
which involves a Layer 1 transaction.

### Interoperating with Existing State Channel Network

With suitable developments, Generalized State Channels can interoperate
with other existing (and future) State Channel Networks, by using
the same payment triggering conditions that they use for routed payments,
whether HTLC (as with the Bitcoin Lightning Network) or otherwise.

The first preexisting network that any Generalized State Channel Network
would want to interface with is probably the Bitcoin Lightning Network itself:
it is the most expansive, with the most available liquidity,
on the most valuable blockchain.

There are or have been many other existing State Channel networks on Ethereum
(such as Kchannels, Raiden, Connext, Perun, Celer,
[StateChannels.org](http://statechannels.org/), etc.), and
possibly on other blockchains, too.
They may or may not be worth interoperating with at some point.

Interoperation means having on-chain smart contracts
that can suitably complete a payment route. But it also means
having routing algorithms that can find a suitable payment routes
in the joined pair of Networks, which is more difficult.
More generally, it will involve Generalized variants of each of
the Bitcoin Lightning BOLT specifications or the equivalent for
each State Channel Network, plus whatever further generalizations
are required so as to accommodate seamless interoperation
between the two or more State Channel networks.

### A Mother-of-All State Channel Network

Once interoperation is achieved between all relevant State Channel Networks
on all relevant Layer 1 Blockchains, the result will be
a Mother-of-All State Channel Network, an Overnet.

End-Users will be able to hold their favorite tokens on their favorite
blockchain in a self-custodial State Channel with a hub participant;
and using this Mother-of-All State Channel Network, they can pay their
suppliers in any token the suppliers prefer on the supplier’s preferred
blockchain, in an atomic transaction that if everyone cooperates will take
a fraction of second, and even if someone doesn’t cooperate, will be safe
and involve a temporary inconvenience for the non-cooperative exit delay
(typically about one week).
Each participant could further keep their accounting
in whichever currency their are required to use, which may differ
from each other and from the two actual kind of tokens used.

Thus, one user may keep some FIL tokens on Filecoin, and pay a supplier
who wants DAI stable coins on Ethereum, or another who wants BTC on Bitcoin,
while keeping their legal accounting in USD, while the others keep theirs
in EUR or ARS. Furthermore, using an on-ramp trusted by the payer, and/or
an off-ramp trusted by the payee, they can also use
the Mother-of-All State Channel Network to transfer funds from any currency
fiat or crypto to any currency fiat or crypto with fast settlement and low fees.
(Presumably, however, if both parties want to hold fiat currency rather than
cryptocurrency tokens or blockchain-hosted stable coins, they may be better off
using a traditional centralized service rather than a decentralized protocol,
whether using State Channels or not—unless the direct fiat payment is otherwise
made impossible for regulatory reasons.)

While it is possible for a State Channel payment to cross several currencies
or several blockchains, in practice it will be too costly and too risky to
make more crossings than strictly necessary: none if the participants want
to hold the same token on the same network, two crossings if the participants
want to hold different tokens on different networks neither of which supports
arbitrary smart contracts so they have to use a smart-contract-capable
blockchain as an intermediary, and one in the more general case.

## System Robustness

### “Non-Functional” Aspects of Software

Software Systems have a lot of “functional” aspects that describe
to the normal behavior of the system when participants and their computers
act in mutually desired or at least normally expected ways.
But Software Systems also have a lot of “non-functional” aspects that
describe the behavior of the system when subjected to stress because
participants or their computers act in undesired, unexpected, erratic,
or at times actively hostile ways.

In the case of Decentralized systems handling digital assets,
a large class of criminals are incentivized to deliberately break
software systems by causing maximum mayhem so as to steal or vandalize
other people's digital assets.
Non-functional aspects, that for most software are often
“nice to have” options that can be provided on a “best effort” basis,
for Decentralized systems quickly become essential features that
must be provided on a must-always-work-or-else basis.

We explain in more details in our [Chenilles System Layer](system.md) document
the system architecture that enables the robustness of our systems
against entire classes of issues that we can anticipate to be experienced
due to natural or artificial stress.

Below we merely discuss the most salient aspects
for which Decentralized systems require extra robustness
compared with what is provided by the operating systems used by most people.

### System Security

State Channels are *active* or “hot” rather than *passive* or “cold”,
in that each participant must continuously run some service that will cooperate
with other participants to complete in a timely fashion transactions
that can be initiated by either side at any moment.
Thus a participant cannot start a State Channel and forget about it:
the computer systems acting as the participant's agents *must* keep running and
partaking in this active cooperation until the channel is eventually closed.
Participation is active, and the computer systems that have the “hot” keys
are particularly juicy targets for all criminals.
A breach in system security can thus result in criminals getting ahold of
the “hot” secret keys and the assets they protect.

An end-user participant who only spends and never receives,
needs not actively participate while not spending.
If the participant only receives small infrequently and
in relatively small amounts, then it is enough to only be
available for active participation at those times, and to
entrust the watching of the blockchain against adversarial exits
to some third party “Watch Towers” that will ensure the other participant
may not cannot steal tokens from them with an older State Channel state.
Security requirements may be slightly relaxed for these casual users,
and the better end-user operating systems
(Android, iOS, Chromebook, Web browsers) *might* be enough to host
their participation in such limited State Channels—until they won’t be.

But in the general case, a participant cannot fully delegate participation
to a technically more proficient third party without trusting that third party
with their keys—at which point the trusted third party is the actual
participant, though acting as trusted agent for the nominal participant.
A first-class participant must ultimately take responsibility for
the security of their systems and the secrecy of their keys.
The buck has to stop somewhere. And wherever that is,
active participation requires more secure systems than most people use today.

## Additional Links

### The Bitcoin Lightning Network

The [Lightning Network](https://lightning.network/)
was the very first State Channel network.
See its [Wikipedia entry](https://en.wikipedia.org/wiki/Lightning_Network)
for some context and history.

The specifications for the network protocol and its extensions lies in the
[Lightning Bolts](https://github.com/lightning/bolts)

The main protocol implementations are
[LND](https://github.com/lightningnetwork/lnd) (Go),
[Core Lightning](https://github.com/ElementsProject/lightning) (C),
[Electrum Lightning](https://github.com/spesmilo/electrum) (Python),
and [Eclair](https://github.com/ACINQ/eclair) (Scala).

### Other notable State Channel Networks

[Celer](https://celer.network/) started as a State Channel network on Ethereum,
but pivoted into a validator network for “watchtowers” then for bridges.
It was programmable in theory, but apparently not in practice.

[Perun](https://perun.network/) was another State Channel network on Ethereum.

Many other implementations existed, but none seems to have gained much traction.
