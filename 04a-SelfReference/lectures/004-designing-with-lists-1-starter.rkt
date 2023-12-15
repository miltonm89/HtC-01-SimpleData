;; designing-with-lists-1-starter.rkt

#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

;PROBLEM:
;
;You've been asked to design a program having to do with all the owls
;in the owlery.
;
;(A) Design a data definition to represent the weights of all the owls. 
;    For this problem call it ListOfNumber.
;(B) Design a function that consumes the weights of owls and produces
;    the total weight of all the owls.
;(C) Design a function that consumes the weights of owls and produces
;    the total number of owls.

;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. each number in the list is an owl weight in ounces
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber


;; Functions:

;; ListOfNumber -> Number
;; produce sum of weights of owls in lon
(check-expect (sum empty) 0)
(check-expect (sum (cons 20 empty)) 20)
;;(check-expect (sum (cons 32 (cons 20 empty))) (+ 32 20))
(check-expect (sum LON2) (+ 42 60))

;(define (sum lon) 0) ;stub

(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)          
            (sum (rest lon)))]))

;; List of Number -> Natural
;; produce total number of weights in consumed list
(check-expect (count empty) 0)
(check-expect (count LON2) 2)
(check-expect (count (cons 12 empty)) (+ 1 0))
(check-expect (count (cons 12 (cons 10 (cons 23 (cons 32 empty))))) (+ 1 1 1 1))

;; (define (count lon) 0) ; stub

(define (count lon)
  (cond [(empty? lon) 0]
	[else 
	  (+ 1
	     (count (rest lon)))]))
(test)
