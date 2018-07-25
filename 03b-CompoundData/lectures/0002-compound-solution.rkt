#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

;; compound-starter.rkt

;; PROBLEM:
; Design a data definition to represent hockey players, including both
; their first and last names.

(define-struct player (fn ln))
;; Player is (make-player String String)
;; interp. (make-player fn ln) is a hockey player with
;;          fn is the first name
;;          ln is the last name
(define P1 (make-player "Bobby" "Orr"))
(define P2 (make-player "Wayne" "Gretzky"))

; for compound data, use all the selectors for the template
(define (fn-for-player p)
  (... (player-fn p)      ;String
       (player-ln p)))    ;String

;; Template rules used:
;; - Compound: 2 fields

(test)
