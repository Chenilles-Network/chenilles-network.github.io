---
Date:	May 2023 (Latest update August 17th 2023)
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

### User-Visible Functionality Milestones

The major milestones for user-visible functionality will be as follows:

  - Minimal *State Channel* prototype: our zero-to-one implementation.

  - Minimal State Channel *Network* prototype: payments with intermediary.

  - Minimal *Generalized* State Channel prototype: simple DApp atop State Channels.

  - Simple Cross-Currency Payments

  - Simple Cross-Chain Payments

  - Simple Routing on par with Lightning Network

  - Simple Fast Confirmation with Rollup Service

  - Interoperation with Lightning Network

  - Interoperation with On-Ramp / Off-Ramp Solutions

  - Interoperation with Bridges and Oracles

  - Interoperation with KYC solutions

  - Advanced Cross-Currency Payments

  - Advanced Routing

  - Advanced Smart Contracts over State Channels

  - Self-Custodial DEX

### Robustness Enhancement Milestones

The major milestones for robustness enhancements will be as follows:

  - Local Encrypted Persistence

  - Remote Encrypted Persistence via IPFS

  - Integration of payments with common cryptocurrency Wallets

  - Integration of DApps with common cryptocurrency Wallets

