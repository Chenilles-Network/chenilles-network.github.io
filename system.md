The *Chenilles* System Layer
============================

Explaining the system layer underlying the implementation of Chenilles.

 - Date: May 2023 (Latest update September 14th 2023)
 - Author: François-René Rideau <f@mukn.com>
 - Company: [Chenilles, LLC](https://chenilles.network)

## Abstract

### Table of Contents

  - [Abstract](#abstract)
    - [Table of Contents](#table-of-contents)
  - [Introduction: A Persistent, Distributed, Adversarial Operating System](#introduction:-a-persistent,-distributed,-adversarial-operating-system)
    - [Rationale](#rationale)
    - [Roadmap](#roadmap)
  - [Persistence](#persistence)
    - [Persistence Meaning](#persistence-meaning)
    - [Persistence Roadmap](#persistence-roadmap)
      - [Minimal persistence to local database, for simple data only](#minimal-persistence-to-local-database,-for-simple-data-only)
      - [Local Encrypted Persistence](#local-encrypted-persistence)
      - [Remote Encrypted Persistence via IPFS](#remote-encrypted-persistence-via-ipfs)
      - [Restoring from Multiple Unreliable Backups](#restoring-from-multiple-unreliable-backups)
  - [Durability](#durability)
    - [Durability Meaning](#durability-meaning)
    - [Durability Roadmap](#durability-roadmap)
      - [Manual Protocol for Resumable Computations](#manual-protocol-for-resumable-computations)
      - [Durability of Computations via a Persistent VM](#durability-of-computations-via-a-persistent-vm)
      - [Compiler from Scheme to the Persistent VM](#compiler-from-scheme-to-the-persistent-vm)
      - [External Monitoring and Restarting of Computations](#external-monitoring-and-restarting-of-computations)
  - [Off-chain Communication](#off-chain-communication)
    - [Off-chain Communication Meaning](#off-chain-communication-meaning)
    - [Off-chain Communication Roadmap](#off-chain-communication-roadmap)
      - [Off-chain Communication through an Ad Hoc Centralized Proxy](#off-chain-communication-through-an-ad-hoc-centralized-proxy)
      - [Off-chain Communication via libp2p](#off-chain-communication-via-libp2p)
      - [Off-chain Communication through Onion Services](#off-chain-communication-through-onion-services)
      - [Off-chain Communication through Matrix, Discord and/or Slack](#off-chain-communication-through-matrix,-discord-and/or-slack)
  - [Testing](#testing)
    - [Testing Meaning](#testing-meaning)
    - [Testing Roadmap](#testing-roadmap)
      - [Testing via Unit Tests and Positive Integration Tests](#testing-via-unit-tests-and-positive-integration-tests)
      - [Testing of Systematic Corner Case Scenarios](#testing-of-systematic-corner-case-scenarios)
      - [Whitebox Fuzz-testing](#whitebox-fuzz-testing)
      - [Proving Correctness of Interaction Models](#proving-correctness-of-interaction-models)
  - [Distributed Processes](#distributed-processes)
    - [Proceses](#proceses)
    - [Process Groups](#process-groups)
    - [Replicated State Machines](#replicated-state-machines)
    - [Consensus](#consensus)
    - [Scheduling](#scheduling)
    - [Testing](#testing)
    - [Naming](#naming)
  - [Persistence](#persistence)
    - [Surviving Critical Events](#surviving-critical-events)
    - [Encrypted Databases](#encrypted-databases)
    - [Migration](#migration)
  - [Security](#security)
    - [Password Management](#password-management)
    - [Capabilities](#capabilities)
    - [Censorship-resistance](#censorship-resistance)
    - [Location-resistance](#location-resistance)
    - [Optimization through Partial Trust](#optimization-through-partial-trust)
  - [Modelling and Audit](#modelling-and-audit)
    - [Modelling](#modelling)
    - [Auditing](#auditing)
  - [Community](#community)

## Introduction: A Persistent, Distributed, Adversarial Operating System

### Rationale

The [System Robustness section in our Concepts document](concepts.md#system-robustness)
explains why this *Chenilles* System Layer is necessary.

### Roadmap

The major milestones for robustness enhancements will be as follows.
Robustness work can be shared between all supported blockchains, but
there is still additional work involved as the code base grows,
whether by supporting more blockchains or adding more features.

## Persistence

### Persistence Meaning

Persistence is the ability for data to survive when computations are faced
with adverse events such as software failure, hardware failure, power loss,
remote hacking, physical intrusion, physical robbery, fires, floods, bombings,
solar flares, earthquakes, tsunamis, wars, etc.

Some of these events are common, some are uncommon.
Some are preventable or avoidable, some aren’t.
Some are insurable, others are not insurable.
The eventuality of one of them is almost certain,
though which it will be isn’t predictable.
Yet, with suitable software infrastructure, it is possible to survive
any number of these events, and the broader the set of survivable events,
the broader the Persistence.

### Persistence Roadmap

#### Minimal persistence to local database, for simple data only

In the first version of *Chenilles*, we will implement
just the minimum amount of persistence required,
saving data to a local database, without remote replication,
and only for the simple interactions that we initially support.

In further versions of *Chenilles*, we will implement more elaborate
persistence, with remote copies (e.g. using IPFS), and for a generalized class
of interactions supporting arbitrary smart contracts.

#### Local Encrypted Persistence

We will implement database encryption and keep all data encrypted
in the local database, based on some master password
(see [Password Management](#password-management)).

#### Remote Encrypted Persistence via IPFS

#### Restoring from Multiple Unreliable Backups

## Durability

### Durability Meaning

Persistence for running code, not just data.
Not only will the relevant data not be lost when the adversarial events happen;
the code will resume from where it has stopped right after the event is over.
A short interruption is all you will experience,
while the overall system “fails over” to a rebooted computer session,
a spare processor, a backup data center, or whichever extra computing system
will take over when the “main” one fails.
Meanwhile, additional backups will automatically be started so
close consecutive events won’t stop the system.

### Durability Roadmap

#### Manual Protocol for Resumable Computations

#### Durability of Computations via a Persistent VM

#### Compiler from Scheme to the Persistent VM

#### External Monitoring and Restarting of Computations

## Off-chain Communication

### Off-chain Communication Meaning

### Off-chain Communication Roadmap

#### Off-chain Communication through an Ad Hoc Centralized Proxy

#### Off-chain Communication via libp2p

#### Off-chain Communication through Onion Services

#### Off-chain Communication through Matrix, Discord and/or Slack

Interoperation with common existing messaging protocols and systems.

## Testing

### Testing Meaning

### Testing Roadmap

#### Testing via Unit Tests and Positive Integration Tests

#### Testing of Systematic Corner Case Scenarios

Property-based testing.
Precise specification of the interaction space.

#### Whitebox Fuzz-testing

Automated inference

#### Proving Correctness of Interaction Models

## Distributed Processes

### Proceses

### Process Groups

### Replicated State Machines

### Consensus

### Scheduling

### Testing

### Naming

## Persistence

### Surviving Critical Events

### Encrypted Databases

### Migration

## Security

### Password Management

Integration with ssh daemon or gpg daemon or yubikey or physical key, etc.

### Capabilities

### Censorship-resistance

### Location-resistance

### Optimization through Partial Trust

## Modelling and Audit

### Modelling

Key parts of the system may require a formal model
that allows for the development of proofs,
and maybe even for the automatic extraction of correct code.

### Auditing

Our code will require at some point some in-house auditing,
as well as an independent audit by reputable third-parties.

The *Chenilles* steering committee shall hire competent independent auditors
before each release for each part and every part of the system,
whether user-visible features or user-invisible robustness work,
with enough advance to allow for integrating feedback
from the audit into the system itself.

## Community

Building a healthy community is important to the enduring success
of a project like *Chenilles*.

[Symmathesy](https://norabateson.wordpress.com/2015/11/03/symmathesy-a-word-in-progress/),
[Scenius](https://medium.com/salvo-faraday/what-is-the-scenius-15409eb6ac72)
