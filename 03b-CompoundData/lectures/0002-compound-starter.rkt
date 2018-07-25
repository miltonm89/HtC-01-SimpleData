#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
(check-expect false true)
(check-expect true false)

;; compound-starter.rkt

;; PROBLEM:
; Design a data definition to represent hockey players, including both
; their first and last names.


(test)
