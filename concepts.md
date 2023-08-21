---
Date:	May 2023 (Latest update August 21st 2023)
URL:	https://chenilles-network.github.io/concepts.html
Author:	François-René Rideau <f@mukn.com>
Company:	Mutual Knowledge Systems, Inc. < https://mukn.com >
Address:	218 NW 24th Street, 2nd Floor, Miami FL 33127
---
# Concepts Underlying the *Chenilles* Network

  - [State Channels: Safe, Scalable, Private Payments](#state-channels:-safe,-scalable,-private-payments)
    - [State Channels](#state-channels)
    - [Layer 2](#layer-2)
    - [Trust Assumptions](#trust-assumptions)
    - [Number of Participants](#number-of-participants)
    - [Assets Under Control](#assets-under-control)
    - [Opportunity Costs of State Channels](#opportunity-costs-of-state-channels)
    - [How a State Channel Works](#how-a-state-channel-works)
    - [Watching the Blockchain](#watching-the-blockchain)
    - [Scaling Transactions](#scaling-transactions)
    - [More Than Two Participants](#more-than-two-participants)
    - [State Channels are Side-Chains](#state-channels-are-side-chains)
    - [Extra Privacy through Extra Cryptography](#extra-privacy-through-extra-cryptography)
  - [State Channels Networks: Payments At Scale](#state-channels-networks:-payments-at-scale)
    - [Network Payments](#network-payments)
    - [Layer 2 Transaction Fees](#layer-2-transaction-fees)
    - [Payment Atomicity](#payment-atomicity)
    - [Interrupted Routes](#interrupted-routes)
    - [Mitigations for Route Interruptions](#mitigations-for-route-interruptions)
    - [Payment Routing](#payment-routing)
    - [Mapping the Network](#mapping-the-network)
  - [Generalized State Channels: Smart Contracts on State Channels](#generalized-state-channels:-smart-contracts-on-state-channels)
    - [The Possibility of Generalized State Channels](#the-possibility-of-generalized-state-channels)
    - [The Challenge of Generalized State Channels](#the-challenge-of-generalized-state-channels)
    - [Making Generalized State Channel Contracts Feasible](#making-generalized-state-channel-contracts-feasible)
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
directly between the participants, outside of the blockchain proper,
which is what enables the speed, low-cost, safety and privacy.

While Bitcoin does not support general-purpose smart contracts,
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

### Watching the Blockchain

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

If on the other hand you receive significant assets through the State Channel,
you should make sure to watch the blockchain carefully, and
have multiple watchtowers, either in-house or hired contractors,
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

### Network Payments

Given a network of State Channels, where each participant has one or more
channels open with as many other participants, it becomes possible
for one participant in the network to send tokens to another participant
through intermediaries. For instance,
participant A sends 5 tokens to participant B,
who sends 5 tokens to participant C, etc., until
participant Z receives 5 tokens from participant Y.
As long as tokens are fungible, and there is a “route” of channels from A to Z,
each with sufficient liquidity to cover the 5 tokens in the correct direction,
then a transfer is possible.

Thus, even though a given participant may only have a single State Channel open
with only one other participant, they will be able to transact with any other
participant in the entire network that they are indirectly connected to.

Such “network payments” enable very fast and cheap, private transactions
between all participants in a large network layered on top of about any Blockchain,
over amounts as small or as big as participants are willing to add liquidity for.

### Layer 2 Transaction Fees

The costs involved in a Network Payment are tiny.
Each intermediary may charge a fee to cover their part,
yet the fees may be small enough that even after adding all the fees
from all the intermediaries, the overall Network Payment will still be
much cheaper than a direct transaction on the underlying Layer 1 blockchain.

Specialized intermediaries may thus profitably maintain many State Channels open
with plenty of end-users and multiple other such specialized intermediaries,
providing a “hub” in the Network, and charging a small fee at each transaction.

### Payment Atomicity

For security purposes, each intermediate transaction along the route
will be made conditional on some triggering event, such that
either all transfers happen, or none of them do—a
property known as “atomicity”.

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

## Generalized State Channels: Smart Contracts on State Channels

### The Possibility of Generalized State Channels

On Ethereum and other smart-contract capable blockchains
State Channels can be used not merely for payments,
but also for arbitrary conditional interactions between participants—be it
a futures contract, an auction, a poker game, etc.
State Channels with such functionality are called “Generalized State Channels”.

Smart-contract capable blockchains include Ethereum, and after it
Cardano, Solana, PolkaDot, Avalanche, Cosmos, Filecoin, Internet Computer,
Aptos, Algorand, Tezos, MINA, Nervos,
and their respective forks and clones (list not exhaustive).
But they emphatically do not include Bitcoin, Ripple, Monero, Stellar, Zcash,
and their respective forks and clones (list not exhaustive).

It is quite easy on smart-contract capable blockchains
to modify the basic State Channel infrastructure
to accept Generalized State Channels—and
much cheaper to add this functionality earlier than later.
Thus we propose that any future State Channels should indeed be
Generalized State Channels from the get go.

### The Challenge of Generalized State Channels

Now, it is extremely difficult to offer a programming environment that
makes it safe and affordable to develop contracts on top of State Channels.

Indeed, contracts on State Channels must be written in multiple versions,
such that one version does the off-chain computation
and signing of updates on Layer 2, but
another version does the on-chain verification and enforcement on layer 1—and
the two have to match _perfectly_,
for any discrepancy may lead to one or both participants losing their assets.

Existing State Channels require these on-chain and off-chain versions to be written
in completely different languages:
Solidity or some other blockchain-specific language for the on-chain part,
JavaScript or some other client-side language for the off-chain part,
and sometimes also Go or some other server-side language for a redundant off-chain part.

Moreover most of the on-chain code is meant never to be run
during in the normal usage of a State Channel.
Only in exceptional situations will small bits of it being will be invoked,
a different little bit in each situation.
That code thus requires careful design and systematic testing
quite unlike any code that anyone usually writes or tests.

Finally, making contracts that can be run over a path of multiple state channels
rather than between participants directly connected by a single state channel
involves extra complexity and extra collateral at every step along the way;
creating a new state channel directly connecting the participants is an option
that can simplify away that complexity, but itself incurs some costs and limits to scaling.

All these constraints combine into making the task of writing
Smart Contracts over State Channels an extremely complex challenge,
that is not affordably feasible using the current technology.

### Making Generalized State Channel Contracts Feasible

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

[CELER](https://celer.network/) started as a State Channel network on Ethereum,
but pivoted into a validator network for “watchtowers” then for bridges.
It was programmable in theory, but apparently not in practice.

[PERUN](https://perun.network/) was another State Channel network on Ethereum.

Many other implementations existed, but none seems to have gained much traction.
