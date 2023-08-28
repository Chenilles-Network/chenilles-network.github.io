---
Date:	May 2023 (Latest update August 17th 2023)
URL:	https://chenilles-network.github.io/roadmap.html
Author:	François-René Rideau <f@mukn.com>
Company:	Mutual Knowledge Systems, Inc. < https://mukn.com >
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

### Plan Summary

We understand that time is of the essence in launching our Network.
Therefore, we will start by implementing the smallest necessary subset of
the Network features, then will keep adding features to the working system.
The major milestones will be as follows:

  1. Simple State Channels: payments only, between two participants only.
     A minimal command-line only client that uses a centralized service
     for off-chain communications. No persistence beyond logs.
     This will be our zero-to-one prototype.

  2. Payments with one intermediary: simple payments between two participants
     with a single Intermediary; routing payments between many participants
     using a hub-and-spoke network. Web interface connected to a local server.

  3. Network Payments: simple payments in a network, with a simple routing
     algorithm, and a gossip network to announce changes, following the
     principles of the Lightning Network.

  4. Smart Contracts for Token Swaps: simple token swaps as usable for
     Network Payments, using smart contracts over Generalized State Channels.

  5. 
