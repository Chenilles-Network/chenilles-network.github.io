The *Chenilles* Roadmap
=======================

 - Date: May 2023 (Latest update September 14th 2023)
 - Author: François-René Rideau <f@mukn.com>
 - Company: [Chenilles, LLC](https://chenilles.network)

## Abstract

This is our roadmap to design, build and market
[*Chenilles*](https://chenilles.network/),
the next-generation State Channel Network,
scalable, interoperable and programmable.

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

### Table of Contents

  - [Abstract](#abstract)
    - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
    - [A Plan to Develop Chenilles](#a-plan-to-develop-chenilles)
    - [Cost Estimates](#cost-estimates)
    - [Plan Overview](#plan-overview)
      - [Minimal Prototype](#minimal-prototype)
      - [Simple Functionality](#simple-functionality)
      - [Interoperation](#interoperation)
      - [Advanced Functionality](#advanced-functionality)
      - [Wallet Integration](#wallet-integration)
  - [Development Roadmap for User-Visible Functionality](#development-roadmap-for-user-visible-functionality)
    - [Minimal State Channel Prototype](#minimal-state-channel-prototype)
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
    - [Interoperation with On-Ramp / Off-Ramp Solutions](#interoperation-with-on-ramp--off-ramp-solutions)
    - [Interoperation with Bridges and Oracles](#interoperation-with-bridges-and-oracles)
    - [Interoperation with KYC solutions](#interoperation-with-kyc-solutions)
    - [Advanced Cross-Currency Payments](#advanced-cross-currency-payments)
    - [Advanced Routing](#advanced-routing)
    - [Advanced Smart Contracts over State Channels](#advanced-smart-contracts-over-state-channels)
    - [Advanced Support for Self-Custodial DEX](#advanced-support-for-self-custodial-dex)
    - [Wallet Integration of Simple Payments](#wallet-integration-of-simple-payments)
    - [Wallet Integration of Simple Routing](#wallet-integration-of-simple-routing)
    - [Wallet Integration of Cross-Currency & Cross-Blockchain Payments](#wallet-integration-of-cross-currency--cross-blockchain-payments)
    - [Wallet Integration of DApps](#wallet-integration-of-dapps)
    - [Privacy Enhancements](#privacy-enhancements)
    - [Financial Layer](#financial-layer)

## Introduction

### A Plan to Develop Chenilles

We presented in the
[Chenilles Glow whitepaper](https://chenilles.network/whitepaper.html)
our cross-blockchain Network of Generalized State Channels,
its overall vision, its capabilities, and how it will solve the main issues
that currently block cryptocurrencies from “going to the Moon”.

We also wrote a [conceptual introduction](https://chenilles.network/concepts.html)
that expounds the concepts that underlie the design of *Chenilles*,
and explains how our Generalized State Channels work.

In this document, we will take as granted an understanding of these end goals
and technical means, and will focus on presenting
a plan to implement those goals using those means, that
maximizes earlier returns on lower investments.

We understand that time is of the essence in launching our Network.
Therefore, we will start by implementing the smallest necessary subset of
the Network features, then will keep adding features to the working system.
We also understand that the Network safety measures must increase to match
its functionality least users fall prey to increasingly motivated attackers.
Therefore, we will ramp up [System Robustness](concepts#system-robustness) features
in synch with user-visible functionality, which we discuss
in our separate [Chenilles System Layer](system) document.

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
wholly in parallel with other phases by distinct developers.
We’ll add in every phase which other phases it depends on.

### Plan Overview

Our development will include the following phases for each target Blockchain.
Only so much work can be saved when building for subsequent target Blockchains,
and some additional work is also required when adding new target Blockchains,
especially but not only for interoperation.
Support for each target Blockchain can be funded either
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

### Minimal State Channel Prototype

This phase will create the building block of *Chenilles*,
the simplest of State Channels, implemented on top of the target Blockchain.

**Business case enabled**: Self-custodial payments between two participants.
Potential users would be utilities accepting small pay-per-use micropayments,
or large accounts looking for a fast, private and non-custodial way
to settle trades with their peers, or anything in-between.

This stage will be subdivided in steps as follows:

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
They will support non-cooperative as well as cooperative exits,
though some automation of non-cooperative exits may be stubbed out.
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

**Business case enabled**: Self-custodial payments in a centralized network.
In the simplest case, a single hub will enable payments between users
having State Channels open with the hub.
In a more elaborate case, a fixed core of interconnected hubs
enables payment from any user to any user with a centralized routing algorithm.
Still, all payments remain self-custodial.
The worst that the central participants can do is censor trades long enough
for the users to close their State Channels and find better intermediaries
to trade through, or directly use the Layer 1 without intermediaries.
Target users would be anyone as end-users, and crypto businesses as intermediaries.

**Dependencies**: [Minimal State Channel Prototype](#minimal-state-channel-prototype).

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

1. Concurrent Transactions and Generalized State Channel Infrastructure.
   This enables multiple conditional payments at a time
   over a single State Channel.
   Also enable a basic escape to general smart contracts
   (which is easy to add now on smart contract capable Blockchains,
   and harder to add later),
   but with minimal support for actually writing smart contracts if at all
   (which would require developing a lot of infrastructure in Solidity or
   what replaces it on the target Blockchain, or implementing *Glow*).
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
   The sender and recipient can simply tell each other
   which of many intermediaries they support,
   in decreasing order of preference, until they find a suitable one;
   then they initiate a payment using this single intermediary.
   A network where every participant is connected to the same intermediary
   is called a “hub and spokes” network in reference to a bicycle wheel.
   This isn’t the desired decentralized network (built in the next phase),
   but can illustrate the technology so far,
   make it readily usable even before the full network is ready, and
   can serve as the financial seed to the decentralized network to come.
   (18 dvwk)

### Minimal Network Routing Prototype

This phase will enable participants who are not already connected
through a known route of State Channels to dynamically discover and use
routes of intermediaries for payments.

**Business case enabled**: Self-custodial payments in a decentralized network.
The discovery and use of network routes can happen in a decentralized fashion
using a gossip network both spam-resistant and censorship-resistant.
Target users would be anyone as end-users, and anyone who can afford keeping
a server online as an intermediary.

**Dependencies**: [Minimal Payment Route Prototype](#minimal-payment-route-prototype).

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
State Channels.

**Business case enabled**: Fast private scalable DeFi over state channels.
Instead of merely payments, State Channels will accelerate arbitrary smart
contracts between participants in a decentralized network:
Atomic swaps, NFT auctions, online games, etc.
Target users would be anyone interested in DeFi.

**Dependencies**: [Minimal State Channel Prototype](#minimal-state-channel-prototype).

This ability will put our State Channel Network far ahead of existing networks,
that in practice support no such thing, though some do in theory.
At each step, we will enhance our language *Glow* to implement
the additional features through State Channels.

The features below are largely independent and could be developed in parallel
by several people at the same time.

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

This phase will enable one participant to pay in one currency and another to
receive in another currency, using suitable intermediate State Channels.

**Business case enabled**: Self-custodial payment from one currency to another.
Potential users would be anyone who wants to trade *on the same blockchain*,
though they may not want to hold the same token as the users they trade with.
Some may prefer native tokens, others may prefer a stable coin,
yet others some specific ERC20, etc.

**Dependencies**:
    [Minimal Payment Route Prototype](#minimal-payment-route-prototype),
    [Minimal Generalized State Channel Prototype](#minimal-generalized-state-channel-prototype).

1. A microeconomic study of the proper pricing of the *option* implicit
   in any asynchronous currency swap protocol,
   as applied to cross-currency payments.
   Design and implementation of a suitable microeconomic mechanism for
   determining rates and fees in the network depending on confirmation delay,
   expected volatility and non-cooperative exit costs.
   (18 dvwk)
2. A modification to the Bitcoin HTLC contract that allows for shorter delays
   by enabling early resolution of the Hash part of HTLC while still waiting
   for the Time-Lock part of the State Channel exit process, thus drastically
   lowering the total volatility exposure and accompanying exchange fees.
   (18 dvwk).
3. An extension to the off-chain *Chenilles* communication protocols
   so payments can be made along a route that involves a change in currency,
   at some agreed exchange rate,
   properly compensating the party doing the exchange,
   if a suitable event happens within a deadline.
   (18 dvwk)
4. As a further way to reduce delay, an extension to the *Chenilles* on-chain
   contract and payment route protocol on the target Blockchain,
   that relies on publication of a single witness within a deadline
   to trigger a series of transfers.
   (18 dvwk)

### Simple Cross-Chain Payments

This phase will enable participants to use routes that cross blockchain
boundaries to effect payments between the target Blockchain and Ethereum.

**Business case enabled**: Self-custodial payment between blockchains.
Potential users would be anyone who wants to trade on any supported blockchain.
They may not want to hold the same token as the users they trade with, and
they may not even want to use the same blockchain. But as long as
both blockchains are supported by *Chenilles* the buyer can pay the seller.

**Dependencies**:
    [Minimal Network Routing Prototype](#minimal-network-routing-prototype),
    [Simple Cross-Currency Payments](#simple-cross-currency-payments).

1. An extension to the off-chain *Chenilles* communication protocols
   so payments can be made along a route that involves State Channels
   on both target Blockchains (Bitcoin and Ethereum if not otherwise funded,
   or either with a funded target Blockchain if funded), at some agreed
   exchange rate, properly compensating the party doing the exchange,
   using the Lightning Network HTLC (or modified variant above).
   Note that unmodified Lightning Network HTLC might not allow for affordable
   exchange fees unless using wBTC as wrapped by a mutually trusted bridge.
   (18 dvwk)
2. A protocol for discovering routes that span *Chenilles* across two networks.
   (18 dvwk)
3. A variant of the protocol that allows for faster confirmation given a
   suitable bridge between the two Blockchains, such that a single event on one
   can be observed on the other and be used as the condition for whether or not
   the payment was confirmed.
   (18 dvwk)

### Simple Routing on par with Lightning Network

This phase will bring *Chenilles* on par with the Bitcoin Lightning Network,
when the previous stage was minimal in terms of functionality.
This will put *Chenilles* ahead of the Bitcoin Lightning Network,
and prepare *Chenilles* for the next stage in routing of smart contracts.

**Business case enabled**: Self-custodial payment in a decentralized network.
Potential users are anyone desiring more decentralization in their payments
sent or received, as well as anyone willing to make their liquidity available
as intermediaries, for a fee.

**Dependencies**:
    [Minimal Network Routing Prototype](#minimal-network-routing-prototype).

1. An update to our Minimal Network Routing Prototype, that matches all
   the features of the Bitcoin Lightning Network protocol.
   (36 dvwk)

### Simple Fast Confirmation with Rollup Service

This phase will implement a service that allows for faster confirmation of
transactions than is possible with traditional Layer 1 transactions,
either as a rollup or on a dedicated data availability engine.
Faster confirmation means reduced exposure to volatility in cross-currency and
cross-chain transactions as well as faster reuptake of liquidity involved
in transactions, leading to better capital efficiency and cheaper transactions.
An rollup is slower and more expensive but does not require additional
trust assumptions, unlike a dedicated data availability engine,
that requires that all parties should trust its validation committee.

**Business case enabled**: Faster cheaper cross-currency transactions.
Everyone will benefit from such a service.

**Dependencies**:
    [Minimal Generalized State Channel Prototype](#minimal-generalized-state-channel-prototype).

1. Modification of the smart contract and payment protocol to use a
   confirmation service using a rollup with a central validator.
   (18 dvwk)
2. Update the central validator to itself accept service payment via State Channels.
   (18 dvwk)
3. Build a decentralized market for services that publish confirmation.
   (18 dvwk)
4. Extend the decentralized market into a protocol for a dedicated
   data availability engine with or without rollup to any specific blockchain.
   (18 dvwk)
5. Robustify the decentralized protocol.
   (18 dvwk)
6. Issue tokens for the decentralized protocol.
   (18 dvwk)

### Interoperation with Lightning Network

This phase will enable participants to discover and use intermediaries to
effect payments across blockchains between the target Blockchain, Ethereum and Bitcoin.

**Business case enabled**: Interoperation between *Chenilles* and the Bitcoin Lightning Network.
Everyone who wants to hold Bitcoin or has customers or suppliers who do
will benefit from such a service.
All the liquidity in the Bitcoin Lightning Network will be made available
to *Chenilles* and vice versa, increasing the network effects and value
of both networks.

**Dependencies**:
    [Simple Cross-Chain Payments](#simple-cross-chain-payments),
    [Simple Routing on par with Lightning Network](#simple-routing-on-par-with-lightning-network).

1. Enhance the *Chenilles* cross-chain routes to interoperate work with
   the Bitcoin Lightning Network.
   (18 dvwk)
1. Enhance the *Chenilles* cross-chain routing algorithm to interoperate work with
   the Bitcoin Lightning Network.
   (18 dvwk)
3. Make proposals to enhance the Bitcoin Lightning Network with extensions
   (BOLT - Basis Of Lightning Technology) that will facilitate future
   interoperation with the *Chenilles* Network:
   better and faster HTLCs, route payment protocol extensions,
   routing algorithm extensions, better APIs, etc.
   (18 dvwk)
4. Extend the *Chenilles* Network with counterparts for each and every feature
   that the Bitcoin Lightning Network possesses, to ensure complete
   interoperability.
   (18 dvwk)

### Interoperation with On-Ramp / Off-Ramp Solutions

This phase will enable participants to connect their *Chenilles* payments
to on-ramp and off-ramp solutions enabling payment from or to fiat accounts.

**Business case enabled**: Interoperation between *Chenilles* and centralized finance.
Everyone who wants to deal with blockchain will benefit from such a service.

**Dependencies**:
    [Simple Cross-Chain Payments](#simple-cross-chain-payments).

1. A protocol for *Chenilles* participant to use on-/off- ramp solutions
   they trust as part of private yet auditable atomic operations.
   (18 dvwk)
2. An extension to the off-chain *Chenilles* routing protocols so it can
   discover intermediaries, negotiate exchange rates and route payments
   between on-chain tokens and off-chain currencies.
   (18 dvwk)
3. Extensions that allow to pay more for faster service, and/or
   insure against potential delays from non-cooperating intermediaries.
   (18 dvwk)

### Interoperation with Bridges and Oracles

Allow smart contracts on *Chenilles* to query bridges and oracles in general.

### Interoperation with KYC solutions

Enable operators of *Chenilles* services to easily comply
with any applicable KYC requirements in their jurisdiction.

### Advanced Cross-Currency Payments

Enable cross-currency payments that make direct use of
existing bridges, oracles, etc.,
to reduce volatility or enhance privacy, etc.

### Advanced Routing

Route not just payments but arbitrary smart contracts.

### Advanced Smart Contracts over State Channels

Implement more interesting contracts on State Channels.
Smart Contracts on Channels with more than two participants.
Smart Contracts on a sub-network of Channels connecting more than two end-participants
with many intermediaries.
Better *Glow* for all the above situation.


### Advanced Support for Self-Custodial DEX

Implement an entire DEX using State Channels and a data availability engine.

### Wallet Integration of Simple Payments

Seamlessly integrate *Chenilles* payments along known routes into all relevant Wallets.

### Wallet Integration of Simple Routing

Seamlessly integrate *Chenilles* routing algorithm into all relevant Wallets.

### Wallet Integration of Cross-Currency & Cross-Blockchain Payments

Seamlessly integrate cross-currency and cross-chain *Chenilles* payments
into relevant wallets that are aware of multiple blockchains.

### Wallet Integration of DApps

Seamlessly integrate arbitrary DApps on top of *Chenilles*
into relevant DApp-aware wallets.

### Privacy Enhancements

Enhance the *Chenilles* Network so as to make its transactions completely
opaque to non-participants, including
the presence of the State Channels themselves.
This phase could be done largely in parallel
with anything after the Minimal State Channel Prototype.

1. Use of a Schnorr or ECDSA multisig lock to protect a State Channel.
   This enhances both the efficiency of the network and its privacy,
   by making State Channels indistinguishable from regular addresses
   as long as participants cooperate, and not cost anything more either.
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
