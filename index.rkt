#lang at-exp racket @; -*- Scheme -*-

(require
 scribble/html
 "utils.rkt")

(output-xml
  (html
    @page-head{The Chenilles Network}
    (body
      (div-header @T{The @em{Chenilles} Network}
                  @T{The next-generation cross-blockchain State Channel Network})
      (div-toc (apply ul (map (lambda (x) (li (Doc x))) sections)))
      (div-contents
        (p nbsp)
@p{
@(Chenilles) is a complete interoperability solution to transmit value
across currencies and assets, across blockchains and centralized networks,
supporting not just instant payments but also elaborate DApps,
safely, privately, and at scale, with or without zk encryption.
}
@p{
Our @Doc{Whitepaper} presents the business vision for
how the @(Chenilles) Network will make cryptocurrencies “go to the moon”.
}
@p{
Our @Doc{Team} is the right one to make it all happen. Contact us!
}
@p{
Our @Doc{Concepts} document expounds
the technical and economic concepts underlying @(Chenilles)
and its Generalized State Channels.
}
@p{
Our @Doc{Roadmap} details our plan to build and market
the @(Chenilles) Network and the new applications enabled by each milestone.
}
@p{
Our @Doc{System} document describes how we will address
the ever increasing Robustness challenges of our Network as it grows in value.
}
@p{
@href["mailto:contact@chenilles.network"]{Contact us} for our Pitch Deck.
}))))
