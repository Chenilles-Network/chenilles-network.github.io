# TODO for this Website

Stuff cut from other documents, to include into these pages.

## Other things to integrate into the website

  * Feedback from the MINA zkignite program:
    https://zkignite.minaprotocol.com/zkignite/dev4dev/refineproposals/suggestion/585
    and
    https://zkignite.minaprotocol.com/zkignite/dev4dev/refineproposals/suggestion/585/discussions

-------------------------------------------------------------------------------

# Chenilles Systems Layer

To demonstrate as much value as possible with as little upfront investment
as possible, we can restrict ourselves to a solution
that works in the simplest of cases:
payment through a single centralized intermediary.
The sender and recipient can simply tell each other
which of many intermediaries they support,
in decreasing order of preference, until they find a suitable one;
then they initiate a payment using this single intermediary.
A network where every participant is connected to the same intermediary
is called a “hub and spokes” network in reference to a bicycle wheel.

XXX We will start by only offering a simple hand-written demonstration of one
simple contract on top of our infrastructure, to illustrate an application
that is possible with (Generalized) State Channels on Filecoin, but impossible
on Bitcoin. Later on, we will develop a complete, safe and affordable
programming environment for contracts on top of our Generalized State Channel
infrastructure.

At that point, parties who already know each other and their intermediaries
can make payments. To complete the *Chenilles* Network, we need a protocol
whereby parties can find the intermediaries for their transactions. Happily,
we can build upon the work already done by the Bitcoin Lightning
Network. Unhappily, a lot of that work is Bitcoin-specific and will have to be
ported or generalized, enhanced or fixed, to work with Filecoin and
*Chenilles*. We will build:

Even then, there are a lot of features that Filecoin may or may not want to
fund as part of the third and fourth stages of development, and we will
negotiate the precise feature set that Filecoin is willing to fund before we
reach the point of implementing each feature.

As for what Layer 1 networks to support, we will prioritize supporting the
most liquid markets, which these days mean Ethereum and Bitcoin; but we will
also seek funding from various blockchain foundations, companies and
communities for *Chenilles* to support their blockchains earlier and better.

-------------------------------------------------------------------------------

## Payment Routes with a Hub-and-Spoke Architecture

In a second version of *Chenilles*, We will support conditional payments
     through an HTLC, allowing for trustless atomic transactions from user to
     user, with some technical Intermediary who need not be trusted for safety
     (though indeed for liveness).

  3. We will demonstrate multiple nested “Layer 2 to 3” State Channels (L23)
     inside a single L12 State Channel, allowing for many independent
     transactions at the same time.

At that point, we will have a simple yet robust Hub-and-Spoke payment network.
with the configured Intermediary as the Hub.

### Connecting *Chenilles* and other State Channel Network

But even before then, it can be used for more special purpose payments, for
web3 utilities, for limited hub-and-spoke network with a semi-trusted
intermediary, or network of mutually semi-trusted intermediaries between which
routing is easier.

We will not do any of that in the first version of our State Channels, but we
will keep our desire for compatibility somewhat in mind when designing this
initial version.

### Generalized State Channels On Ethereum and other smart-contract capable
blockchains (which does not include Bitcoin), State Channels can be used not
merely for payments, but also for arbitrary conditional interactions between
participants—be it a futures contract, an auction, a poker game, etc. State
Channels with such functionality are called “Generalized State Channels”.

It is quite easy on Ethereum and similar blockchains to modify the basic State
Channel infrastructure to accept Generalized State Channels—and much cheaper
to add this functionality earlier than later. Thus we propose that the State
Channel we implement for *Chenilles* should indeed be Generalized State
Channels from the get go.

However, it is quite difficult to offer a programming environment that makes
it safe and affordable to develop contracts on top of state channels: indeed,
contracts must then be written in multiple versions in different languages,
such that one version does the off-chain computation and signing of updates on
layer 2, but another version does the on-chain verification and enforcement on
layer 1—and the two have to match perfectly, or else one or both participants
may lose their assets.

We will start by only offering a simple hand-written demonstration of one
simple contract on top of our infrastructure, to illustrate an application
that is possible with (Generalized) State Channels on *Chenilles*, but
impossible on Bitcoin.  Later on, we will develop a complete, safe and
affordable programming environment for contracts on top of our Generalized
State Channel infrastructure.

-------------------------------------------------------------------------------

### Action Plan Step 1: Simple State Channels We will write a set of contracts
that implement State Channels, together with a client that can use them for
fast payment between a user and the Network—enabling micropayments.

Estimated time: 1.5 months for 2 developers.  Step 2: Nested State Channels We
will build on-chain and off-chain code that implements Nested L23 State
Channels on top of L12 State Channels.

Estimated time: 1.5 months for 2 developers.  Step 3: Payments with
Intermediary We will build on-chain and off-chain code that implements atomic
payment with an intermediary using HTLCs. The Network will be the intermediary
between parties, which makes discovery and routing trivial.

Estimated time: 1.5 months for 2 developers.  Step 4: Productizing the Network
Make sure the above code is ready for prime time, not just a working demo,
etc.

Estimated time: 2.5 months for 2 developers.

## Project Summary

## Future Work Our proposal is for the development of an initial, working,
production-ready version. This initial version will be optimized for
simplicity of development and launching fast. Its code may not be the best
code for the long run; many obvious improvements may be possible.

The following steps are NOT scheduled to be completed as part of the present
project, but as a follow up, after the completion of the present project.

### Audit Our proposal does not include an independent audit of our code.

We recommend that any big users and customers of *Chenilles* should conduct an
independent audit, or have a third party conduct such an audit before blessing
the code for production.

If such an independent audit is conducted in a timely fashion, we will
integrate feedback from this audit (including simple fixes to any security
issue found) as part of this work.

### Maintenance Our proposal does not include maintenance of the code after
launch.

Maintenance covers fixing issues, adding features, improving performance,
reducing costs, improving usability, producing additional documentation, etc.

Separate contracts will be required for that additional work, if initial
customers are satisfied with the product being delivered.

### Productization of a Decentralized Layer 2 Network

We believe there is tremendous value in eventually completing and productizing
a complete Ethereum Lightning Network.  Here are the steps required to build
such a network, when there is enough interest in the future.

  * Demonstrating the possibility of integrating Ethereum State Channels from
    *Chenilles* with the Bitcoin Lightning network, with a simple HTLC circuit
    across the two networks and an existing wrapped BTC contract.

  * Implementing decentralized routing in a network.

  * Implementing decentralized node discovery.

  * Implementing negotiation with the nodes along the circuit.

  * Implementing watchtowers for our Ethereum Lightning Network.

  * Implementing each and every feature of the Bitcoin Lightning Network on
    Ethereum.

  * Implementing nodes that know about both Bitcoin and Ethereum Lightning
    Networks and use some trusted data feed as an exchange rate oracle.

  * Implementing routing across chains.

  * Implementing strategies that optimize the liquidity for the Lightning
    Network across chains.

### Contracts on top of State Channels

We strongly believe in the value of eventually developing and productizing
support for arbitrary contracts on Generalized State Channels, if only to
demonstrate their possibility on Ethereum as opposed to Bitcoin:

  * Allowing for arbitrary contracts between two participants on a state
    channel.

  * Allowing for arbitrary contracts between two participants with many
    intermediaries.

  * Allowing for arbitrary contracts with any fixed number of participants on
    a single channel.

  * Allowing for arbitrary contracts with any fixed number of participants on
    a circuit.

  * Automatic generation of contract-and-off-chain code for two participants.

  * Automatic generation of contract-and-off-chain code for any number of
    participants.

## Project Description

*Chenilles* is a next-generation cross-blockchain State Channel Network.  We,
at [*Mutual Knowledge Systems*](https://mukn.io/), a.k.a. MuKn (pronounced
“Moon” — the K is silent), have already started building *Chenilles*, on
Ethereum.

### Benefits of State Channels in General

With *Chenilles* as with all State Channels:

- Two participants in a channel can send tokens to each other safely, cheaply,
  quickly and *privately*, scaling far beyond what Layer 1 supports.
- Participants can safely, cheaply, quickly, atomically and privately send
  fungible tokens along a circuit of State Channels of sufficient liquidity,
  in network such as the Bitcoin Lightning Network.

### Innovative Extra Benefits of *Chenilles* Network

Beyond what other State Channel networks do:

- The *Chenilles* Network enables participants to send tokens *across
  blockchains*, so you can send FIL and the recipient would get ETH, or vice
  versa.
- The *Chenilles* Network can potentially interoperate with any other State
  Channel Network, including the Bitcoin Lightning Network itself.
- *Chenilles* allows not just two participants, but tens of participants, on a
  same State Channel, as long as they all keep cooperating in a timely manner.
- *Chenilles* allows not just one kind of token (e.g. FIL, ETH or BTC) on a
  State Channel, but any number of token kinds including NFTs (e.g. FIL, some
  ERC20s and some ERC721s).
- *Chenilles* can scale not just payments, but arbitrary contracts, between
  its participants (e.g. swaps, futures, market making, insurance, auctions,
  poker games, etc.)
- *Chenilles* can multiplex many nested State Channels within an existing
  State Channel, such that many concurrent conditional transactions can be
  executed at the same time on a single State Channel.
- *Chenilles* allows contracts to be written once in a single language,
  *Glow*, that is safe, concise and portable, when other Networks require
  contracts to be written identically in two or three unsafe languages
  (e.g. Solidity, Go and JS for contracts on Celer) wherein any issue in any
  of the three variants and any discrepancy between them may cause asset loss.
- *Chenilles* with *Glow* will support compiling contracts to zk-SNARKs using
  Lurk, such that terms of the contract remain private even in case of timeout
  and non-cooperative exit from the State Channel.
- *Chenilles* enables use of blockchain-specific capabilities, such that State
  Channel contracts on Filecoin can invoke payment conditions based on the
  data stored on network.

### Value

The technical capabilities of *Chenilles* set it far ahead of current State
Channel technology. Therefore the value generated by adding liquidity to the
*Chenilles* Network will be vastly superior to that of adding it to existing
networks. By funding the development of *Chenilles* through a grant:

1. Filecoin will increase the scalability and privacy of transactions on the
   Filecoin network, thereby creating utility for Filecoin users, and
   increasing the value of the network and its token.
2. Filecoin will interoperate with other blockchains in a safe and efficient
   way, increasing the value both of Filecoin and of those other blockchains.
3. Filecoin will become an early adopter of the *Chenilles* network and of
   *Glow* and capture a larger part of their mindshare than the other
   blockchains that will only be supported later.
4. Filecoin will create synergies with Filecoin’s Lurk platform (that we at
   MuKn are also working on), wherein by combining a Lurk contract and a State
   Channel, the Lurk contract interactions can be made to scale whereas the
   contractual conditions attached to the State Channel will remain private
   even in case of non-cooperative exit.

The *Chenilles* network can be an extremely valuable addition to the Filecoin
ecosystem. At the same time, Filecoin can better foster the appearance of such
a network by funding this addition through a grant to a blockchain-agnostic
entity like MuKn than by building it in-house. Indeed, an entity tied to a
specific blockchain might cause some other blockchains to fear giving an
advantage to whichever rival appears as the leader, whereas a
blockchain-agnostic entity will reassure them that they will get a fair
treatment in a cross-chain network that benefits all participants.

## Deliverables

### Low-hanging Fruits in a Tall Tree

Our complete plan for *Chenilles* goes all the way from implementing single
State Channels to building a payment and smart-contract network that
interoperates with other State Channel networks such as the Bitcoin Lightning
Network, as well as a financial settlement system that leverages this
technical infrastructure. However, we divided this plan in shorter phases such
that each phase produces a deliverable that noticeably enhances the value of
the Filecoin network, with compounded effects as the deliverables build upon
each other. Thus, however far Filecoin is willing to fund this project, it
will reap super-linearly increasing benefits from its investment.

Filecoin does not have to commit to the entire plan initially. Morever,
however much Filecoin puts on the table, it will pay in monthly installments
and keep the option to terminate the project at any time (with one month
notice) should MuKn not demonstrate satisfactory progress. Nevertheless,
earmarking funds for a larger development will allow MuKn to staff the project
with a more stable permanent team that can be completely focused on the
project. An even larger earmark may also allow to parallelize those efforts
that can be parallelized, leading to earlier delivery of a complete product
than a trickle that can only afford a smaller team at a time.

Should Filecoin be only willing to fund part of the project at first, we can
complete the project later based on further grants from Filecoin after the
initial deliverables have been evaluated, or by finding investors who see the
financial potential of *Chenilles* as a cross-chain payment and smart-contract
network. However big or small the initial grant, discussions for further
funding would ideally start early enough that development could continue
uninterrupted, whether funded by grants or by investment.

### Overview of Deliverables

Here is a short description of each of the successive phases of development
that we have planned, and what deliverables or increasing functionality will
be built at each stage. We omit the many subphases in each phase and their
individual deliverables:

1. **Simple State Channels** This phase will create the building block of
*Chenilles*, the simplest of State Channels, implemented on top of Filecoin’s
FVM. The deliverable will enable scalable micropayments between two
participants on Filecoin.

2. **State Channel Paths** This phase will enable participants with a series
of connected State Channels to build a *path* along which payments can be
safely made from a sender to a recipient through a series of
intermediaries. The deliverable will enable scalable routing of micropayments
with explicit paths (a la Bitnet).

3. **State Channel Network** This phase will enable participants who are not
directly connected by a State Channel to dynamically discover and use paths of
intermediaries to route conditional payments. The deliverable will enable
scalable routing of micropayments with implicit paths (a la Internet).

4. **Cross-Chain State Channel Paths** This phase will enable participants to
use paths that cross blockchain boundaries to effect payments between
Filecoin, Ethereum and Bitcoin. The deliverable will enable scalable routing
of micropayments across blockchains with explicit chain crossings.

5. **Cross-Chain State Channel Network** This phase will enable participants
to discover and use intermediaries to effect payments across blockchains
between Filecoin, Ethereum and Bitcoin. The deliverable will enable scalable
routing of micropayments across blockchains with implicit chain crossings.

6. **Smart Contract Enhancements** This phase will enhance the *Chenilles*
Network so as to enable arbitrary smart contracts between a small number of
participants to be conducted through State Channels. This will put our State
Channel Network far ahead of existing networks, that in practice support no
such thing, though some do in theory. At each step, we will enhance our
language *Glow* to implement the additional features through State
Channels. The deliverable will be a rich contract system on top of
*Chenilles*.

7. **Privacy Enhancements** This phase will enhance the *Chenilles* Network so
as to make its transactions completely opaque to non-participants, including
the presence of the State Channels themselves. The deliverable will reinforce
the privacy of payments over State Channels.

8. **Financial Layer** Once the technical layer is sufficiently advanced
(which can start right after phase 2), we will contact people with liquidity
and get them to add liquidity on *Chenilles* by prioritizing the development
of the features they most want, including which financial contracts we should
first support (e.g. futures, auctions, etc.). The deliverable will be a
financial network that uses the technical infrastructure of *Chenilles*.


-------------------------------------------------------------------------------

# Roadmap

## Minimal State Channel Prototype

### Initial State Channel Demo

  - Payments only, between two participants only.
  - Incomplete handling of adversarial case.
  - A minimal command-line only client.
  - Off-chain communications through an ad hoc centralized relay.
  - No persistence beyond logs.

  2. Simplest State Channels: complete but minimal implementation.
     - Still payments only, between two participants only.
     - Complete handling of adversarial case.
     - Still minimal command-line only client.
     - Off-chain communications using libp2p or some such.
     - Still no persistence beyond logs.

  3. Simplest State Channels:
  2. Simplest State Channels: complete but minimal implementation.
     - Still payments only, between two participants only.
     - Complete handling of adversarial case.
     - Still minimal command-line only client.
     - Off-chain communications using libp2p or some such.
     - Still no persistence beyond logs.

3. Payments with one intermediary: simple payments between two participants
     with a single Intermediary; routing payments between many participants
     using a hub-and-spoke network. Web interface connected to a local server.

  4. Network Payments: simple payments in a network, with a simple routing
     algorithm, and a gossip network to announce changes, following the
     principles of the Lightning Network.

  4. Smart Contracts for Token Swaps: simple token swaps as usable for Network
     Payments, using smart contracts over Generalized State Channels.


host connected to peer network
persistent name (for the duration of its sometimes short life)
dapp has many end-points, in a group
dapp description must be agreed upon in advance by many participants
participants find each other on broadcast / gossip network
participants negotiate exact agreement off-chain
persistent process for a group: ?
peer subscribe to uids of processes it owns /
peer listens to messages sent to public keys for which it has secret keys
virtual machines (simulated or physical) have public and private keys
a state channel is a group with a fixed finite list of participants
problem: be able to predict the name of the channel/process before the agreement is reached
petnames and intentnames -- user-subjective short names to identify what process is talking to what other in a meaningful way
globalnames and extentnames -- universal long names uniquely identifying a process
process log -- at the socket level (bytes), channel level (data structures), high-level message (user-visible calls) level?
subscribe & fetch: polling vs interruption when listening
app: main.ss, etc. The micropayment app is a simple app on top of the infrastructure
observability: "ls" on processes, etc. (sometimes requires secret key)
ability to write debug scripts -- including single step for message processing

-------------------------------------------------------------------------------

In the first version of *Chenilles*, we will include and test minimal contract
support for closed interactions conducted over a Generalized State Channel,
for future use. We will not implement anything beyond this minimal support,
and a fortiori we won’t implement a mix between open and closed interactions.

In the first version of *Chenilles*, we will implement and demonstrate a
simple closed interaction over a Generalized State Channel. We will not
implement interactions via intermediaries, which would be the topic of a
further contract.

In the first version of *Chenilles*, we will only write off-chain code for the
base cases that we demonstrate: payment, payment through one intermediary,
payment in nested channels, and the simple closed interaction we choose. We
will not be writing more general off-chain code to handle a complete Filecoin
Lightning Network, and especially not be writing a DSL compiler targeting
Generalized State Channels, though these could be the topic of future
projects.

In the very first version of *Chenilles*, we will implement State Channels by
following the same principles as for the Bitcoin Lightning Network: we will
demonstrate micropayments between two participants on a single “Layer 1 to 2”
State Channel (L12).

None of this support will be developed as part of the first version of
*Chenilles*.  However, it makes sense to develop this functionality in a
future version of *Chenilles*—if only so that users can get better guarantees
regarding the behavior of providers and/or members.  This support would also
come naturally as a feature of a Mother-of-All State Channel Network that can
connect with other State Channels on Ethereum and beyond.

*Chenilles* will eventually include a complete implementation of a
Mother-of-All State Channel Network capable of interoperating with all the
above.  It will involve an Ethereum variant of each of the 11 steps of the
Bitcoin Lightning BOLT specifications, plus additional steps and further
generalizations so as to accommodate seamless interoperation between State
Channel networks.

In the first version of *Chenilles*, we will only implement a simple
interaction between two parties via a single generalized state channel without
intermediaries. We will implement neither state channels with more than two
participants nor interactions between many participants via a circuit. These
more advanced constructions would be the matter for future projects.

In the first version of *Chenilles*, we will implement HTLC support and
demonstrate transfer with the Network as a single intermediary. We may decide
initially not to implement general support for transfer with many
intermediaries, which is not conceptually harder but is more work than
necessary for our value demonstration purposes.

In the very first version of *Chenilles*, we will only implement routing in a
very simple hub-and-spokes network with a single centralized intermediary. We
will implement neither decentralized discovery of a network nor general
routing in an arbitrary network: they are neither conceptually novel nor
specific to Filecoin, and are thus unnecessary for our value demonstration
purposes.

In the first version of *Chenilles*, we will implement just the minimum amount
of persistence required, saving data to a local database, without remote
replication, and only for the simple interactions that we initially
support. In further versions of *Chenilles*, we will implement more elaborate
persistence, with remote copies (e.g. using IPFS), and for a generalized class
of interactions supporting arbitrary smart contracts.
