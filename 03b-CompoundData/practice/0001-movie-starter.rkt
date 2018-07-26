#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;; (check-expect false true)
;; (check-expect true false)


;; =========================
;; Data definitions:
;;
;; PROBLEM A:
;; Design a data definition to represent a movie, including  
;; title, budget, and year released.
;;
;; To help you to create some examples, find some interesting movie facts below: 
;; "Titanic" - budget: 200000000 released: 1997
;; "Avatar" - budget: 237000000 released: 2009
;; "The Avengers" - budget: 220000000 released: 2012
;; 
;; However, feel free to resarch more on your own!


;; =========================
;; Functions: 
;;
;; Problem B:
;; You have a list of movies you want to watch, but you like to watch your 
;; rentals in chronological order. Design a function that consumes two movies 
;; and produces the title of the most recently released movie.
;; 
;; Note that the rule for templating a function that consumes two compound data 
;; parameters is for the template to include all the selectors for both 
;; parameters.

(test)
