#lang at-exp racket @; -*- Scheme -*-
;; Home page for Mutual Knowledge Systems

(require
 scribble/html
 net/url
 (for-syntax syntax/parse)
 commonmark)

(provide (all-defined-out))

(define sections
 '("Home" "Whitepaper" "Team" "Concepts" "Roadmap" "System"))

(define (href url . text) (apply a href: url text))
(define (url url (text url)) (a class: 'url href: url text))

(define (Chenilles) @em{Chenilles})
(define (Glow) @em{Glow})

(define (logo-initials . x) (div class: 'logo-initials x))
(define (logo-name . x) (div class: 'logo-name x))
(define (logo-finals . x) (div class: 'logo-finals x))
(define (char-alphanumeric? c) (or (char-numeric? c) (char-alphabetic? c)))
(define (tagify title) (list->string (filter char-alphanumeric? (string->list title))))
(define (section x . y) (a name: (tagify x) (h1 x y)))
(define (section-ref x) (href (string-append "#" (tagify x)) x))
(define (person name pic . description)
  (p class: 'person
    (img class: 'personpic
         src: (string-append "pics/people/" pic ".jpg")
         alt: name)
    (b name) ", " description))
(define (https url) (url (string-append "https://" url) url))
(define (http url) (url (string-append "http://" url) url))
(define (dq . x) (list "“" x "”"))
(define (--) "—") ;; long dash
(define (AT) (literal "&#64;"))
(define (Doc Name)
  (define name (string-downcase Name))
  (define file (if (equal? name "home") "index.html" (string-append name ".html")))
  (href file Name))

(define (markdown-file->html file)
  (define contents (file->string file))
  (define document (string->document contents))
  (document->html document))

(define (page-head title-text)
  (head
   (meta http-equiv: "Content-Type" content: "text/html; charset=utf-8")
   (meta name: 'viewport content: "width=device-width, initial-scale=1")
   (title title-text)
   (link rel: 'stylesheet href: "style.css")
   #;(link rel: 'icon href: "pics/mukn-icon.svg" type: "image/svg+xml")))

(define (div-header title-html (footnote-html #f))
  (div class: 'header
    #; (img src: "pics/mukn-name.svg" alt: "Mutual Knowledge Systems" class: 'headerpic)
    (h1 title-html)
    (if footnote-html
      (div class: 'title-footnote footnote-html)
      '())))

(define (div-toc . toc-html)
  (div class: 'table-of-contents toc-html))

(define (div-contents . contents-html)
  (div class: 'contents contents-html))

(define T list) ;; @T{foo bar}

(define (wrap-markdown title file)
  (output-xml
   (html
    (page-head title)
    (body
     (div-contents
      (literal (markdown-file->html file)))))))
