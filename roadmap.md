---
Date:	May 2023 (Latest update September 1st 2023)
URL:	https://chenilles-network.github.io/roadmap.html
Author:	François-René Rideau <f@mukn.com>
Company:	Mutual Knowledge Systems, Inc. <https://mukn.com>
Address:	218 NW 24th Street, 2nd Floor, Miami FL 33127
---
# Chenilles Roadmap: a Scalable, Interoperable and Programmable State Channel Network

### Abstract

This is our roadmap to design, build and market
the [*Chenilles* Network](https://chenilles-network.github.io/).

*Chenilles* is a new payment network that can transmit value across blockchains
and currencies with a direct connection to on-ramp and off-ramp solutions.
*Chenilles* uses next-generation Generalized State Channels
and supports smart contracts as well as payments.
*Chenilles* will embrace and extend the
[Bitcoin Lightning Network](https://lightning.network/)
and connect it to all blockchains.
*Chenilles* will remove the main hurdles that prevent cryptocurrencies
from “going to the Moon”: scalability, safety and usability.

Our roadmap emphasizes the early release of
partial but already useful and marketable products
as “low-hanging fruits” on the road to delivering a complete working product,
prioritizing support for the most useful blockchains.
We will keep building along this roadmap, revising it based on market feedback.

    - [Abstract](#abstract)
  - [Introduction](#introduction)
    - [A Plan to Develop Chenilles](#a-plan-to-develop-chenilles)
    - [Plan Overview](#plan-overview)
    - [Cost Estimates](#cost-estimates)
    - [User-Visible Functionality Milestones](#user-visible-functionality-milestones)
      - [Minimal Prototype](#minimal-prototype)
      - [Simple Functionality](#simple-functionality)
      - [Interoperation](#interoperation)
      - [Advanced Functionality](#advanced-functionality)
      - [Wallet Integration](#wallet-integration)
  - [Development Roadmap for User-Visible Functionality](#development-roadmap-for-user-visible-functionality)
    - [Minimal State Channel Prototype Roadmap](#minimal-state-channel-prototype-roadmap)
      - [Discovery](#discovery)
      - [Prototype](#prototype)
      - [Robustization](#robustization)
      - [Integration](#integration)
      - [Documentation](#documentation)
    - [Minimal Payment Route Prototype](#minimal-payment-route-prototype)
    - [Minimal Network Routing Prototype](#minimal-network-routing-prototype)
    - [Minimal Generalized State Channel Prototype](#minimal-generalized-state-channel-prototype)
    - [Simple Cross-Currency Payments](#simple-cross-currency-payments)
    - [Simple Cross-Chain Payments](#simple-cross-chain-payments)
    - [Simple Routing on par with Lightning Network](#simple-routing-on-par-with-lightning-network)
    - [Simple Fast Confirmation with Rollup Service](#simple-fast-confirmation-with-rollup-service)
    - [Interoperation with Lightning Network](#interoperation-with-lightning-network)
    - [Interoperation with On-Ramp / Off-Ramp Solutions](#interoperation-with-on-ramp-/-off-ramp-solutions)
    - [Interoperation with Bridges and Oracles](#interoperation-with-bridges-and-oracles)
    - [Interoperation with KYC solutions](#interoperation-with-kyc-solutions)
    - [Advanced Cross-Currency Payments](#advanced-cross-currency-payments)
    - [Advanced Routing](#advanced-routing)
    - [Advanced Smart Contracts over State Channels](#advanced-smart-contracts-over-state-channels)
    - [Advanced Support for Self-Custodial DEX](#advanced-support-for-self-custodial-dex)
    - [Wallet Integration of Simple Payments](#wallet-integration-of-simple-payments)
    - [Wallet Integration of Simple Routing](#wallet-integration-of-simple-routing)
    - [Wallet Integration of Cross-Currency & Cross-Blockchain Payments](#wallet-integration-of-cross-currency-&-cross-blockchain-payments)
    - [Wallet Integration of DApps](#wallet-integration-of-dapps)
    - [Privacy Enhancements](#privacy-enhancements)
    - [Financial Layer](#financial-layer)

## Introduction

### A Plan to Develop Chenilles

We presented in the
[Chenilles Glow whitepaper](https://chenilles-network.github.io/whitepaper.html)
our cross-blockchain Network of Generalized State Channels,
its overall vision, its capabilities, and how it will solve the main issues
that currently block cryptocurrencies from “going to the Moon”.

We also wrote a [conceptual introduction](https://chenilles-network.github.io/concepts.html)
that expounds the concepts that underlie the design of *Chenilles*,
and explains how our Generalized State Channels work.

In this document, we will take as granted an understanding of these end goals
and technical means, and will focus on presenting
a plan to implement those goals using those means, that
maximizes earlier returns on lower investments.

### Plan Overview

We divide our plan in multiple parallel tracks,
one part with the user-visible features that handle assets,
one part with the user-invisible features that keep the system safe.
Each track will include a series of milestones
each enabling more business use cases.

We understand that time is of the essence in launching our Network.
Therefore, we will start by implementing the smallest necessary subset of
the Network features, then will keep adding features to the working system.
We also understand that the Network safety measures must increase to match
its functionality least users fall prey to increasingly motivated attackers.
Therefore, we will ramp up robustness features in synch
with user-visible functionality.

### Cost Estimates

We estimate costs in abstract units of developer-week (or *dvwk* for short),
which represents one week of work by one developer assigned full-time
on the project, but which also accounts for technical leadership costs,
management costs, administrative costs, consulting costs
(for when the main assigned developer needs help from another expert),
ancillary costs, amortized software and hardware costs, etc.

To account for the above,
we estimate a monetary cost of $5000/dvwk for a short-term grant.
This cost can decrease if a target Blockchain is willing to commit
to a long term development grant and/or to shoulder the risk of cost overrun.
In particular, when *Chenilles* is spending based on its own reserves
according to its own plan with guaranteed long term support,
the cost can be halved, by hiring and training permanent employees
rather than temporary pre-trained expert contractors.

Actual delivery time for any step may be shorter than
the estimated number of developer-weeks (if work is somewhat parallelizable
between multiple developers, within the limits of Amdahl’s Law),
but will likely longer (due to various delays, sickness, vacations, etc.).
On the other hand, given sufficient budget, some phases can be executed
wholly in parallel with other phases by distinct developers
(e.g. phases 6 to 8 vs other phases between 3 and 8).

### User-Visible Functionality Milestones

Our development will include the following phases for each Blockchain.
Only so much work can be saved when building for subsequent Blockchains,
and some additional work is also required when adding new Blockchains,
especially but not only for interoperation.
Support for each Blockchain can be funded either
out of *Chenilles*’ own capital for the most strategic blockchains
without governance capable of funding it, or
out of grants from the Blockchain’s governance (Foundation, Treasury, etc.).

The major tracks and their milestones for per-Blockchain user-visible functionality
will be as follows:

#### Minimal Prototype

This phase implements just enough functionality to prove the concepts, and
make them barely usable by programmers and enthusiastic end-users.

  - Minimal *State Channel* prototype: our zero-to-one implementation.

  - Minimal *Payment Route* prototype: payments with identified intermediary.

  - Minimal *Network Routing* prototype: finding intermediaries for payments.

  - Minimal *Generalized* State Channel prototype: simple DApp atop State Channels.

#### Simple Functionality

(This track depends on completion of the Minimal Prototype track.)

  - Simple Cross-Currency Payments

  - Simple Cross-Chain Payments

  - Simple Routing on par with Lightning Network

  - Simple Fast Confirmation with Rollup Service

#### Interoperation

  - Interoperation with Lightning Network

  - Interoperation with On-Ramp / Off-Ramp Solutions

  - Interoperation with Bridges and Oracles

  - Interoperation with KYC solutions

#### Advanced Functionality

  - Advanced Cross-Currency Payments

  - Advanced Routing

  - Advanced Smart Contracts over State Channels

  - Advanced Support for Self-Custodial DEX

#### Wallet Integration

  - Wallet Integration of Simple Payments

  - Wallet Integration of Simple Routing

  - Wallet Integration of Cross-Currency & Cross-Blockchain Payments

  - Wallet Integration of DApps

## Development Roadmap for User-Visible Functionality

The following roadmap will have to be repeated for every supported blockchain.

### Minimal State Channel Prototype Roadmap

This phase will create the building block of *Chenilles*,
the simplest of State Channels, implemented on top of the target Blockchain.

As a business case, it will enable micropayments between two participants.

It will be subdivided in steps as follows:

1. A study of how best to implement State Channels on the target Blockchain:
   what interfaces to use, amend or add.
   This will help better estimate development costs.
   (6 dvwk)
2. The simplest implementation of State Channels, including
   both a smart contract for the target Blockchain VM and
   client code capable of communicating with it—enabling micropayments.
   (6 dvwk)
3. A robustization of the above, making for
   State Channels that can be trusted with actual tokens,
   rather than a mere demonstration that assumes favorable conditions.
   (12 dvwk)
4. Integration of State Channels with the standard target Blockchain wallet.
   This will enable micropayments by regular users of the target Blockchain
   rather than merely by programmers familiar with a command-line.
   (12 dvwk)
5. Documentation for all the above, including a live recorded demonstration,
   and addressing issues found while documenting.
   (18 dvwk)

As with every phase of our plan, it is conceivable to
stop at the end of any step and have made measurable progress
towards improving the value of the target Blockchain.
But we recommend going all the way to the end of a phase for this progress
to generate tangible value to end-users of the target Blockchain.
Thus for 6 dvwk we could stop at the study;
for 12 dvwk we could have a working demo;
for 24 dvwk we could have a robust prototype;
for 36 dvwk we can integrate the prototype with a target Blockchain wallet;
and for 54 dvwk the entire thing can be documented and debugged
such that regular users can use it.

Furthermore, if payment of each step is made conditional on the previous step,
then development will take an entire year by a single developer.
However, if the entire phase is authorized in advance
and paid in larger monthly installments,
2 to 3 developers can work together in parallel and
make it happen in 6 to 9 months.

Below are details on each of the steps.

#### Discovery

We will start with a study in which we will examine in depth
how our existing *Chenilles* technology does or doesn’t fit
in the target Blockchain ecosystem:
what facilities we can reuse of *Chenilles* and of the target Blockchain,
what functionality we must custom-build for the target Blockchain
vs other blockchains, which interfaces we must hook into (e.g. wallets),
what features the interested parties in the target Blockchain community
deem more important, etc.

Detailed plans will be written to determine exactly which features
will be implemented in each of the subsequent phases.
While this step limits its deliverable to specifications, documentation,
and requirements for future steps and phases,
it is fundamental to a successful phased roll-out of the system.
Questions we will answer will include:

- What will the target Blockchain smart contract generally look like?
  What implementation strategies will we follow?
- Does the target Blockchain presently have all the capabilities required
  to efficiently implement State Channels?
  Either way, how precisely will which of its capabilities be used or amended?
- Same questions for the target Blockchain client (or server) APIs
  we will use or amend.
- Which multisignature algorithm(s) should we support at first
  for the “happy” consensual case? (e.g. naive counting, ECDSA, Schnorr, BLS).
- Which parts of our Ethereum contract and client infrastructure can we reuse
  as is, versus which must be generalized, and
  which must be reimplemented in the new particular setting?
- How should the client persistent storage fit with the target Blockchain ecosystem?
- How should or shouldn’t we integrate with authentication systems or
  “wallets” commonly used within the target Blockchain community,
  to handle participant identities and funds under automatic management of DApps?
- Do our designs as pertain to the target Blockchain ecosystem pass a preliminary
  review from a competent cryptographer?

We estimate this initial study to cost about 5 dvwk.
From the study will also come a better estimate for the costs
of the following steps and phases.

#### Prototype

We will implement the simplest kind of State Channels for
the target Blockchain, according to the plan established during Discovery,
reusing as much as possible of our previous State Channels for Ethereum.
These State Channels may have a minimal set of features:
only two participants, only one single token kind, no conditional payment,
no concurrent transactions, no nested channels,
no interface beside the command-line, no wallet integration,
no persistence of session information.
But they will support non-cooperative as well as cooperative exit.
As a proof of concept, the prototype will be focused on demonstrating
feasibility, rather than making a complete product.
Reasonable effort will be made so the prototype should be secure,
but corners may be cut as long as they are well-documented.

#### Robustization

Once the prototype establishes the feasability of the endeavor,
we will turn it into a robust product.
We will add all the missing security checks and handle all the corner cases.
However, we will not add any feature beside what is required for security.
In particular, we will stick to a developer-friendly
but end-user-unfriendly command-line interface, and
we will not attempt to integrate with existing the target Blockchain wallets
(which we will do in the following step).
We will not add support for more than two participants, or
more than one token kind (e.g. ETH, ERC20, etc.), or any other functionality.
We will just turn the prototype into something robust.

#### Integration

After we have a robust implementation of those minimal State Channels
for the target Blockchain, we will integrate them
with the most relevant the target Blockchain wallet, so that
end-users of the target Blockchain may actually use them for micropayments.
As above, we will otherwise stick to a minimal set of features.

#### Documentation

We will write a tutorial explaining on how to use our State Channels,
as well as some internal architectural description of how they work underneath.
We will record a demonstration and a tutorial for opening a State Channel
on the target Blockchain, making back and forth micropayments, and
closing the Channel cooperatively, or closing it non-cooperatively.
Together with documentation come some additional debugging and simplifications
for issues that only become apparent as we actively try to
make the product user-friendly.

Note that emphatically not included in the above is
an independent security audit of the product,
that must be conducted by a third party.
We can help connect the target Blockchain with such auditors if desired.
On strategic Blockchains that we support without grant,
we will cover the cost of the audit ourselves, hiring external auditors.

### Minimal Payment Route Prototype

This phase will enable participants with a series of connected State Channels
to build a *route* along which payments can be safely made from a sender to a
recipient through a series of intermediaries.

This phase can be divided in the following steps,
each with its own value-adding deliverable.
In turn each of these steps could be divided into sub-steps of
study, prototype, robustization, user-interface and documentation,
though with a quicker development cycle thanks to building on previous code.
Once again, development can be achieved cheaper and/or faster
if committing in advance to larger phases or steps
rather than smaller steps or sub-steps,
hiring larger teams working in parallel
(though with increasing communication overhead as the teams grow), and
starting each phase or step as soon as the strictly necessary previous steps
are working without waiting for all previous steps to be complete and reviewed.

The steps are as follows:

1. Concurrent Transactions and Generalized State Channels.
   This enables multiple conditional payments at a time
   over a single State Channel.
   (18 dvwk)
2. The simplest Hashed TimeLock Contract (HTLC) as a payment condition.
   This enables safe payments with a timeout to unlock funds
   in case one party fails to cooperate to the end.
   (12 dvwk)
3. An off-chain communication protocol based on libp2p, so
   network participants who already know each other and their intermediaries
   can coordinate their multi-hop transactions.
   (18 dvwk)
4. The combination of the above, so a sender may drive a series of payments,
   along a route of State Channels, through identified intermediaries,
   to a recipient.
   (12 dvwk)
5. A demonstration of micropayments along a route of multiple State Channels on
   the target Blockchain.
   (6 dvwk)
6. As a useful application, a simple hub-and-spoke network can route payments
   from any participant to any other participant
   via a single common intermediary, centralized yet non-custodial.
   This isn’t the desired decentralized network (built in the next phase),
   but can illustrate the technology so far,
   make it readily usable even before the full network is ready, and
   can serve as the financial seed to the decentralized network to come.
   (18 dvwk)

### Minimal Network Routing Prototype

This phase will enable participants who are not already connected
through a known route of State Channels to dynamically discover and use
routes of intermediaries for payments.

Note: our estimates for this phase and the subsequent phases
are not fleshed out, and could be 2x or 3x too large or too small, but
we believe remain of the correct indication of the order of magnitude.
The time required also depends on the team we will be able to hire
which depends on the budget allotted and whether it is committed in advance.

1. An off-chain protocol to announce and discover the nodes
   in a State Channel Network.
   (18 dvwk)
2. An algorithm to discover routes for payments in a known graph of nodes.
   (18 dvwk)
3. A protocol to negotiate payment along a planned route.
   (18 dvwk)
4. A protocol combining the above to route payments on the Network.
   (18 dvwk)
5. A protocol to rate and blacklist uncooperative nodes
   in the State Channel Network.
   (18 dvwk)
6. A protocol to split a payment along several routes.
   (18 dvwk)

### Minimal Generalized State Channel Prototype

This phase will enhance the *Chenilles* Network so as to enable arbitrary
smart contracts between a small number of participants to be conducted through
State Channels. This will put our State Channel Network far ahead of existing
networks, that in practice support no such thing, though some do in theory. At
each step, we will enhance our language *Glow* to implement the additional
features through State Channels.

1. State Channels that can transfer more than one kind of asset.
   Example: ETH and ERC20s including wrapped Bitcoin and
   wrapped (via bridge) tokens from target Blockchain.
   (18 dvwk)
2. State Channels with a complex interaction but without external data sources.
   Example: rock paper scissors.
   (18 dvwk)
3. State Channels with a complex interaction using external data sources.
   Example: a futures contract that relies on a price oracle.
   (18 dvwk)
4. State Channels with more than two participants.
   Example: a four-way card game.
   (18 dvwk)
5. Using State Channels as conditional payment for a public contract.
   Example: an auction with private bids over State Channels.
   (18 dvwk)
6. Using State Channel routes for exchange between more than two parties.
   Example: a three-way atomic swap between three assets across
   triangular payment routes.
   (18 dvwk)

### Simple Cross-Currency Payments

***TODO: update the document from here on...***

This phase will enable one participant to pay in one currency and another to
receive in another currency, using suitable intermediate State Channels.

1. A modification of the HTLC contract to account for currency exchange rates
   and their volatility, and the issue of a State Channel payment
   being an *option* for the sender.
   (18 dvwk)
2. An extension to the off-chain *Chenilles* communication protocols
   so payments can be made along a route that involves a change in currency,
   at some agreed exchange rate,
   properly compensating the party doing the exchange.
   (18 dvwk)

### Simple Cross-Chain Payments

This phase will enable participants to use routes that cross blockchain
boundaries to effect payments between the target Blockchain and Ethereum.

1. An extension to the off-chain *Chenilles* communication protocols
   so payments can be made along a route that involves State Channels
   on both the target Blockchain and Ethereum at some agreed exchange rate,
   properly compensating the party doing the exchange.
   (18 dvwk)
2. A variant of HTLC that can interoperate with the Bitcoin Lightning
   Network—enabling *Chenilles* on the target Blockchain to connect to the liquidity
   already available on Bitcoin, with proper handling of exchange rate
   volatility and payment option issues whether sending or receiving Bitcoin,
   despite Bitcoin itself having a very limited scripting language so that any
   complex logic must be on the target Blockchain side.
   (18 dvwk)
3. An extension to the off-chain *Chenilles* communication protocol so
   it can interoperate with routes on the Bitcoin Lightning Network
   at some agreed exchange rate.
   (18 dvwk)
4. A demonstration of micropayments not just along a route on the *Chenilles*
   Network on the target Blockchain, but also along a route that involves
   State Channels on the Bitcoin Lightning Network.
   (18 dvwk)
5. A variant of *Chenilles* that can transmit wrapped Bitcoin or wrapped
   Ethereum on State Channels on the target Blockchain, which can displace the exchange
   rate issue so it’s fully handled on the target Blockchain.
   (18 dvwk)

### Simple Routing on par with Lightning Network

### Simple Fast Confirmation with Rollup Service

### Interoperation with Lightning Network

This phase will enable participants to discover and use intermediaries to
effect payments across blockchains between the target Blockchain, Ethereum and Bitcoin.

1. An extension to the off-chain *Chenilles* routing protocols so it can
   discover intermediaries and negotiate exchange rates between the target Blockchain
   *Chenilles* Network and the Ethereum *Chenilles* Network. (18 dvwk)
2. An extension to the off-chain *Chenilles* routing protocols so it can
   discover intermediaries and negotiate exchange rates between the target Blockchain
   *Chenilles* Network and the Bitcoin Lightning Network. (18 dvwk)
3. Demonstrating payments across blockchains. (18 dvwk)
4. Extend the *Chenilles* Network with counterparts for each and every feature
   that the Bitcoin Lightning Network possesses, to ensure complete
   interoperability. (18 dvwk)
5. Similarly, ensure that *Chenilles* have feature parity and interoperability
   with Celer or any other relevant State Channel Network already
   established. (18 dvwk)

### Interoperation with On-Ramp / Off-Ramp Solutions

### Interoperation with Bridges and Oracles

### Interoperation with KYC solutions

### Advanced Cross-Currency Payments

### Advanced Routing

### Advanced Smart Contracts over State Channels

### Advanced Support for Self-Custodial DEX

### Wallet Integration of Simple Payments

### Wallet Integration of Simple Routing

### Wallet Integration of Cross-Currency & Cross-Blockchain Payments

### Wallet Integration of DApps

### Privacy Enhancements

Enhance the *Chenilles* Network so as to make its transactions completely
opaque to non-participants, including
the presence of the State Channels themselves.
This phase could be done largely in parallel
with anything after the Minimal State Channel Prototype.

1. Use of a Schnorr or ECDSA multisig lock to protect a State Channel.
   This enhances both the efficiency of the network and its privacy.
   (18 dvwk)
2. Use of zk-SNARKs (via Lurk, SnarkyJS, etc.) to add privacy
   to payment conditions even during non-cooperating exits.
   (18 dvwk)
3. Modification of the off-chain communication protocols to allow for
   private State Channels.
   (18 dvwk)
4. Add a store-and-forward relay service to the off-chain communication network
   for asynchronous communications between parties, and/or
   support encrypted email (e.g. via protonmail or tutanota)
   as a medium for exchanging messages.
   (18 dvwk)
5. Demonstration of completely opaque State Channel payments
   on the target Blockchain.
   (18 dvwk)

### Financial Layer

Once the technical layer is sufficiently advanced
(which can start right after the Minimal State Channel Prototype),
contact people with liquidity and convince them to make some available
on *Chenilles*, and/or ask them which features we should prioritize
to get them to add liquidity on *Chenilles*, including which financial
contracts (e.g. auctions, futures, etc.) we should first support.

1. Contact liquidity providers, starting as early as we have a working system,
   and increasing exponentially as we ramp up the features.
   (18 dvwk)
2. Prioritize and implement whichever features they most need.
   (18 dvwk)
3. Implement a service for paid-for watch towers.
   (18 dvwk)
