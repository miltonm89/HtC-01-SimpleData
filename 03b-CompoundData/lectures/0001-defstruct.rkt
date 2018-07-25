#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

; Create a 'struct' of a coordinate position, x and y
(define-struct pos (x y))

; define some examples using the 'constructor'
; constructor automatically created with define-struct
(define P1 (make-pos 3 6))
(define P2 (make-pos 2 8))

; use a 'selector' to find individual coordinates
(pos-x P1) ;3
(pos-y P2) ;8

; finally use the 'predicate' to see if the constant is a position
(pos? P1)      ;true
(pos? "hello") ;false

(test)
