#lang at-exp racket @; -*- Scheme -*-

(require
 scribble/html
 "utils.rkt")

(output-xml
@html{
@head{
  @meta[http-equiv: "Content-Type" content: "text/html; charset=utf-8"]
  @meta[name: 'viewport content: "width=device-width, initial-scale=1"]
  @title{The Chenilles Team}
  @link[rel: 'stylesheet href: "style.css"]
  @;@link[rel: 'icon href: "pics/mukn-icon.svg" type: "image/svg+xml"]
}
@body{
@div[class: 'header]{
@; @img[src: "pics/mukn-name.svg" alt: "Mutual Knowledge Systems" class: 'headerpic]
@h1{The @em{Chenilles} Team}
@;@div[class: 'title-footnote]{
@;We pronounce @(MuKn) like @dq{Moon} (or @dq{Myun}), as it stands for MU-tual KN-owledge.
}
@; TODO: hide the menu behind a button at the top when on mobile (?)
@div[class: 'table-of-contents (apply ul (map (lambda (x) (li (Doc x))) sections))]
}
@div[class: 'contents]{
@p[nbsp]
@p{
This document describes the team building @(Chenilles),
the next-generation cross-blockchain State Channel Network.
}

@h2{Our Company}
@p{
@href["https://chenilles.network"]{Chenilles, LLC.}
}

@h2{Our Development Team}
@ul{
@li{@href["https://linkedin.com/in/fahree"]{François-René Rideau, Chief Scientist and CEO}}
@;@li{Marcin Grzybowski, Vice President of Formal Methods}
@li{Henri Lesourd, Senior Scientist}
@li{Donald Fisk, Senior Scientist}
}
@p{
Incubated by @href["https://mukn.com/"]{Mutual Knowledge Systems, Inc.}
a.k.a. “MuKn” (pronounced “Moon” — the K is silent).
}

@h2{Team code repositories}
@p{
Our @(Glow) programming language: @url{https://github.com/Glow-Lang/glow}
}

@h2{Technical Track Record of Our team}
@p{
Relevant previous work by our technical contributors are listed in
the Wiki for our @(Glow) language, section
@href["https://github.com/Glow-lang/glow/wiki/Bibliography-Glow"]{Bibliography}
}
@h2{Contact us!}
@p{
@(url "mailto:contact@chenilles.network" "contact@chenilles.network")
}}})
