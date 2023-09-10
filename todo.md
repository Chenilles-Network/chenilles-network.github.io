# TODO for this Website

Stuff cut from other documents, to include into these pages.

-------------------------------------------------------------------------------

## Integrate Feedback from the MINA zkignite program

https://zkignite.minaprotocol.com/zkignite/dev4dev/funding/suggestion/585/detail
https://zkignite.minaprotocol.com/zkignite/dev4dev/funding/suggestion/585/discussions

Brent Fitzgerald
I was not familiar with the Chenilles project prior to seeing this proposal. Sounds like an innovative and promising network! I also understand that you're probably facing a cold start challenge in getting other chains to play with yours, and so it makes sense that you're looking to find integration points.

Since we're assessing proposals' potential for positive impact on the Mina community and dev ecosystem, I'd like to learn a bit more about Chenilles and its team. I'd love either direct replies, or links/documents that answer these questions succinctly.

* How is Chenilles development and upkeep funded?
* Who are the owners and investors in MUKN? Do you have a public cap table or similar ownership info you can share?
* Apart from the use cases enabled, who else benefits from Chenilles usage?
* What is some compelling evidence of the value of Chenilles? Existing use cases? Milestones achieved? Celebrity endorsements? How can I comfortably and confidently agree that Chenilles compatibility is worth Mina investing $70K - $140K?
* Who decides Chenille's development roadmap and deployments? Is it a governance process? Should Mina Foundation or some Mina working group receive governance votes as part of this grant deliverable?
* Would you please point me to a technical overview of Chenille? The Whitepaper only covers high level proposed features.
* How does the Chenille network operate? Is it a consensus network?
* What is Chenille's approach to safety and security? What keeps Chenille from being exploited?

And I also have a few questions about how this project fits into Mina strategically:

* Why does Mina need a smart contract network? Would this replace zkApps?
* GLOW is not a well-known language. Would Mina zkApp developers need to use GLOW in order to take advantage of Chenille cross-chain interop?
* What's your justification for Mina integration with Chenille rather than other approaches to bridging?
* What would be an example zkApp that uses Chenille? Describe the developer experience and the user experience.

Thanks!
08.08.2023 | 23:41

Francois-Rene Rideau1. Chenilles is new, and a prototype is still being developed, so no wonder you haven’t heard of it yet.

2. So far, Chenilles has been funded as side effect of other contracts. We are currently seeking grants and investment to further pursue its development.

3. The current owners of MuKn are the listed team; we haven’t published the cap table yet, and the formula is being changed right now as we’re spinning Chenilles off from MuKn. We haven’t taken investment yet, so it’s a matter of (re)distributing the shares between the founders. I’ve been active in crypto full-time since 2017, and previously contributed to the Tezos whitepaper, and the top members of my current team has been with me since 2019.

4. We believe there are three main population targets for Chenilles: (a) end-users who would use a Chenilles state channel as a fast cross-currency debit-card account that also enables smart contracts; (b) more advanced users including defi traders who would use channels both ways for fast access to non-custodial DEXes built on top of Chenilles; (c) financial institutions and big companies that would use Chenilles as a fast non-custodial settlement solution. Of course, another case of beneficiaries are token holders and blockchain companies and foundations that see the blockchain valuations rise thanks to the new use cases and increased usage.

5. Since Chenilles isn’t launched yet, I can only offer indirect evidence of its utility: (a) the fact that the Bitcoin Lightning Network, of which it will be a superset, has already demonstrated some success; (b) the fact that current Centralized Exchanges have repeatedly demonstrated their unsafety (MtGox, FTX), whereas current Decentralized Exchanges are way too slow, but Chenilles can help build *non-custodial* yet fast Decentralized Exchanges; (c) the fact that the Chenilles design unlike Lightning, allows for more than 2 participants in a same channel, allowing for more capital-efficient private settlements yet still in a non-custodial way. No celebrity endorsement yet—if you know where to find celebrities, I’m interested. There is of course a speculative aspect to any investment or grant, but we’re a solid team with a good track record, and it’s a great design with enormous potential quite unlike most of the competition.

6. Currently we’re a small team with a tight budget and have been setting the roadmap according to what we believe will yield the lowest hanging fruit earliest on the way to building the entire network, and will adjust based on the feedback we receive. Our formal governance structure for now is that of our own company, but we’re in the process of spinning off Chenilles as a separate entity in which our company only has the initial shares. As we accept investment, we’ll grant shares in the governance of this new Chenilles-specific entity. Grants are not usually considered investments; they do have a great influence on the short-term roadmap, but no share of the long-term governance structure is offered in exchange. MINA is most welcome to make an investment in addition to or replacement for this grant, which will lead to governance shares being distributed---but then with no guarantee of a short-term roadmap nor fixed deadlines and deliverables attached to the money, that will go best serving the goals of Chenilles.

7. We have internal roadmap documents and grant proposals to other foundations with more technical details, at various stages of being outdated. I will try to build an updated version that merges all the information from these various documents and post in a further reply.

8. The whole point of Chenilles (and State Channels in general) is to NOT require any additional consensus, but instead leverage any existing (or future) consensus without adding new *safety* assumptions (though with the *liveness* assumption that the other party has the incentive to cooperate). We are not yet another competitor among validation networks, peddling yet another shitcoin. Instead we are a technology that enhances the value of all existing networks by providing a more efficient to use them, that also makes them interoperate in non-custodial ways. Each State Channel is its own unanimity-based L2 (or Ln+1) backed by a contract on a L1 (or Ln) that guarantees that assets are safe even in case unanimity breaks (but may be locked for 1 week—or however long the challenge period is for determining the latest state at the time the unanimity broke down). Unanimity ensures that no additional trust assumption is required. These State Channels themselves become the arcs of a point-to-point overlay network, that still does not require a consensus, only a gossip network to discover the routing paths (quite similar to IP packet routing, except with more cryptography)—though you can also have static paths and more efficient paths discovery algorithms between known entities (i.e. with extra liveness assumptions, though no extra safety assumptions).

9. Chenilles’ approach to safety, just like the Bitcoin Lightning Network, is that everyone remains at all time in custody of all their assets, never ever ever ever EVER introducing any *new* custodian entity either centralized or decentralized. Not your keys, not your coins. Unlike the Lightning Network, pairs or groups of participants are however able to take advantage of any entity (beside or instead of the Bitcoin Network) that they all *already* mutually trust (whether centralized or decentralized, L1 networks, bridges, price oracles, stable coins, exchanges, etc.) as part of transactions involving state channels. Chenilles introduces no new attack surface (except, obviously, its own code base): only your own machine to preserve from hacking, and networks you already trust since you’re using their tokens and/or services. As for the code base, our core team is trained in formal methods, and we’ll be using techniques (functional programming, game semantics) more amenable to eventually proving correctness of our code than most people use.

10. Chenilles’ approach to liveness, just like the Bitcoin Lightning Network, is that you are still responsible to choose your partners well to ensure the funds won’t be locked for a challenge period. There are indeed challenges in routing payments in a pseudonymous network despite liveness failures from bad actors. But we there are various solutions in various situations, some readily available but limited (restricting yourself to identified good actors), some less limited but still research projects (using zkSNARKs to maintain reputations without sacrificing privacy), etc. The solution at hand of behaving like the Bitcoin Lightning Network, decentralized but with occasional liveness failures, is already enough for millions of dollars of monthly payments. In the long run, we will do better.

Strategic questions:

11. The Chenilles network, as any State Channel network would, will increase the effective throughput of MINA and its effective privacy by moving a lot of transactions off-chain. Thanks to its contract capabilities, it will also importantly allow fast interoperation of MINA with other networks. Chenilles does NOT seek to replace zkApps--it is itself a zkApp that can interoperate with other zkApps directly on MINA, and/or can help them scale by moving all or part of them off-chain.

12. Glow will not be necessary to use Chenilles or even to write apps on Chenilles. You will be able to program zkApps for Chenilles directly in SnarkyJS, though it might be involve more code than using SnarkyJS without Chenilles, and more code than using Glow (which should be oblivious of whether Chenilles is used or not). Most people will use already written apps on Chenilles and not know whether it was written in Glow, SnarkyJS, Solidity, Bitcoin Script, or anything else. There will be nice synergies between Glow and Chenilles, but the two are largely independent projects.

13. Chenilles actually amplifies existing approaches to bridging, rather than replaces them. For instance, Chenilles will let you take advantage of an existing (centralized, committee-based or algorithmic) bridge to make fast payments along a circuit when a participant receives one MINA coin on MINA, and sends one bridge-wrapped MINA coin on Ethereum. Or you can use DAI-style over-collateralization with a price-oracle in a one-on-one pool, where no one has any wrapped MINA coins, but one participant holds enough Ether on Ethereum to cover the MINA amount even if the price varies wildly, and receives MINA coins on MINA to send Ethers on Ethereum. Or you can arrange a private swap at a mutually agreed upon spot price plus a fee to the liquidity provider, without need of a price oracle, but you only have a few seconds or fractions of seconds to publish a confirmation on a rollup or fast data availability engine. None of these approaches are unique to Chenilles, but Chenilles can decrease the cost, latency and risk associated to them thanks to off-chain scalability—while at the same time making them private by hiding the very existence of the transactions to any not directly involved.

14. The first app that Chenilles will make available is scalable payments in the style of the Bitcoin Lightning Network: to be used for micropayment of metered digital utilities (does not require path payments, just a simple state channel), for cheaper faster and more private payment within MINA (requires path payments), or as a faster cross-currency debit-card alternative (requires both path payments and bridging options). Then we want to add auctions and order-books and all the parts of a DEX. The developer experience will be that we’ll add some persistent service that handles State Channels, timeouts and long-running interactions, data and code replication, so you don’t have to do it yourself---developers can then focus on starting interactions and waiting for the results via a hook, and the Chenilles infrastructure handles everything else.

15. The user experience would be that users would configure preferences as to whom to create channels with or accept transactions from, and which bridging technologies to accept under which circumstances---by default based on some whitelist. The wallet would then autodetect whether or not a given counterparty can be reached using the gossip network, and transmission would automatically use or not use Chenilles, as appropriate. The infrastructure would take things from there, and make the state of its interactions observable by the end-user. However, this particular grant would focus on basic functionality and a CLI interface for developers, and not on implementing good end-user experience yet.
14.08.2023 | 17:38
Daniel Gretzke

Here are my concerns about this proposal:

1. The first milestone listed is "A study for how to implement the concept of State Channels on MINA". In my opinion this step needs to happen before even writing a proposal in the first place. The budget for this scope is quite high so I wouldn't want to gamble on whether this project is even possible to complete.

2. There is no information on what networks participate in the state channel and what volumes are achieved using Chenilles so far. So it is really hard to estimate what value funding this proposal would bring to the MINA network.

3. A comment describes that first there would be state channels between ETH and MINA and channels on the same network (and at a later point interoperability with Bitcoin Lightning). But the point is that Mina zkApps already act like state channels (but a lot more powerful). Because proofs are recursive, you can pass proofs back and forth off chain (like you would with signatures in a state channel for example) and then eventually settle on chain. This would already make the first two proposed implementations obsolete, because I can create a zkApp that will automatically settle and bridge to Ethereum and as every zkApp already has all capabilities of a state channel the second implementation doesn't even make a lot of sense to propose in the first place.

07.08.2023 | 00:47

Francois-Rene Rideau1. Well, it’s pretty clear to me that Chenilles is possible on MINA, since it’s possible on Bitcoin and MINA has a much more potent contract system. API changes needed—if any—should be relatively minor and shouldn’t require an upheaval of the code base. It’s hard to determine what exactly needs to be done before digging deep into the code, though. I’m ready to forfeit the rest of the grant if at the end of this first phase the report says that it can’t be done, or not in ways that MINA is willing to make accommodations for.

2. Chenilles hasn’t launched yet. But Chenilles should quickly enough connect to the Bitcoin Lightning Network, which was estimated last year to be moving $20M/month and growing with a liquidity base of BTC 4000. Interconnecting MINA to this liquidity would be fantastic.

3a. No, MINA and State Channels are different and complementary. zkSnarks and State Channels can both be means to privacy, along independent axes (regarding what transactions, vs how many transactions). Moreover, State Channels allow this scaling and indirect transfers between channels, that are quite difficult (on, the same chain, pointless).

3b. A single State Channel is a notional two-participant (or more) L2 blockchain by unaminity, backed by a L1 blockchain. It requires a specific challenge mechanism to exit from the L2 when one of the users fails to successfully communicate. A random zkApp is no replacement for a State Channel—but a State Channel can be a great vector to scale a zkApp. The two or independent and complementary.
14.08.2023 | 17:39
Alysia Tech

very interesting!



Architecture



- Can you explain more about writing smart contracts with the Glow programming language and how the Mina Ecosystem will be able to integrate with that?

- How feasible is this application design in the snarkyJS ecosystem?



- Why are zero knowledge proofs needed?

- Can you explain more about how developers will integrate with the state channels on Chenilles?

- Can you explain more about how privacy is achieved on these state channels via Mina




03.08.2023 | 09:17

Francois-Rene Rideau1. Integration with Glow is an option for Chenilles. Chenilles can be done with Glow, and Glow without Chenilles. There is synergy between the two, since Glow can automatically generate a lot of code that you’d have to write manually in SnarkyJS.

2. Yes, the application design is totally possible in SnarkyJS. It’s just that with SnarkyJS you’ll have to write applications that, to handle the worst case scenario, has to handle confirmation on both L1 and L2. That’s at least twice as much code, and a style probably quite unlike that of "direct" style SnarkyJS zkApps.

3. The way a State Channel works is that participants unanimously sign updated states of their private, until eventually sign a settlement—or the unanimity breaks down. The settlement case is simple enough: a multisig of the participants agrees as to what assets go where in the end. The more "interesting" case is the fallback: the state updates are the multisig of the participants agreeing to send all assets to a challenge UTXO or state where the state can be replaced by either a multisig settlement, a more recent multisig-signed state (as identified by some sequence number), until a 1-week (or other agreed upon) deadline. To write an app for the State Channel, you need to generate the SnarkyJS code that *would* be published on chain if either the settlement was published OR a state update was published then validated after timeout. None of the code needs not be actually executed while the unanimity lasts, none of the zkproofs need be generated—until a settlement or challenge is actually published. If somehow SnarkyJS makes it hard to operate in that way, we may have to modify its API a little bit to skip the unnecessary and expensive zkproofs—or in the meantime we can generate the unnecessary proofs anyway, though it’s a waste.

4. zkproofs are needed to get the operations posted on MINA—at the beginning and end of the state channel, but not in the middle. The zk verifiers on the other hand must be created at every operation.

5. Integration can happen off-chain for just using Chenilles with existing Chenilles apps, using the API we will provide by the end of this proposed work, or inside zkApps that want to run on top of Chenilles, using an API which will be provided later when the system is more stable and featureful. We will build a library that makes it easier to follow the protocol in 3. It may require one of writing code in continuation-passing style with reified continuations, or modifying the SnarkyJS compiler, or or using Glow as an alternative to SnarkyJS.

6. Privacy is achieved in three ways: (a) the state channel normally appears as an opaque zk verifier for a multisig, such that outside observers cannot even know that it’s a state channel, they can only see that something comes in initially and out in the end; (b) while the state channel operates, the participants may commit any number of transactions including partaking in path payments, and outside observers cannot even see that transactions are happening, how many nor on what topic, all they see is the final settlement, which is a regular transaction as per (a); and (c) even in case unanimity breaks down without a settlement, the challenge exit protocol is hidden behind zk verifiers, so outside observers cannot deduce much, except for the fact that some contract necessitated a bit more input data and interaction steps than usual.
14.08.2023 | 21:09
Dave Autio.
01.08.2023 | 22:14
Mario ZitoIn your pitch you mentioned: "Chenilles could both add a scalability layer to MINA and connect MINA to a greater ecosystem of blockchain payments and contracts." and "MINA could enrich Chenilles with an extra layer of privacy."

But in the Solutions or Architecture sections you don’t describe how you will achieve this or even what aspects will you integrate, just as examples: Enabling to run MINA Smart Contracts in Chenille ? Connecting MINA wallets to support opertations on Chenilles ? What else ?

Also, what blockchains will you support in first phase ? Bitcoin, Ethereum, MINA, ... ?

I think it would be quite good to have to ability to easily interoperate with other chains (at least starting with payments), but you need to explain how you plan to achieve it (feasibilty).
28.07.2023 | 20:41

Francois-Rene Rideau1. Yes, you will be able to write some variants of MINA smart contracts that run on top of Chenilles: thus, a state channel created on MINA will be able to make payments conditional on the outcome of an interaction specified in SnarkyJS. But also portable conditions written in Glow. === Only in scope for this grant is a simple hook that allows use of arbitrary payment conditions on Chenilles, and the simplest possible payments between two participants.

2. Chenilles can help scale transactions on MINA and make their number private, just like the Bitcoin Lightning Network does on Bitcoin—and importantly, allow transfer along paths of state channels that cross blockchain boundaries. === Only in scope for this grant is the simplest case scaling transactions between two participants.

3. Yes, we eventually want MINA wallets to support Chenilles out of the box for scalability and interoperability. === Only in scope for this grant is a simple command-line utility that doesn’t seek integration with wallets.

4. In a first phase, we’d support Ethereum and MINA separately for single channels. Then we’d add support for payment along a path of several channels within a single network. Then we’d add payment cross-currency within a single network with a suitable SWAP contract. Then path payments with a SWAP. Then path payments across blockchain boundaries. Finally, we’d add interoperability with the Bitcoin Lightning Network. We would then have payment interoperability of MINA will all blockchains that matter (and more to come if needed). === Only in scope for this grant is MINA support of a simple state channel between two participants.

In summary, Chenilles is an ambitious project that can bring a lot of value to MINA and the entire blockchain ecosystem—but the scope of this grant is to make the simplest use case work on MINA, which is enough of a challenge. We’ll build upon it once it’s working.
