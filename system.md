# Chenilles System Layer

Explaining the system layer underlying the implementation of Chenilles.

## Introduction: A Persistent, Distributed, Adversarial Operating System

### 

See our [concepts](concepts.md#system-robustness) document.

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

#### Local Encrypted Persistence

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

### Capabilities

### Censorship-resistance

### Location-resistance

### Optimization through Partial Trust

