#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

;; boolean-list-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of booleans. Call it ListOfBoolean. 
; 

; ListOfBoolean is one of:
; - empty
; - (cons Bool ListOfBoolean)
(define LOB-1 empty)
(define LOB-2 (cons true empty))
(define LOB-3 (cons true (cons true (cons false empty))))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else (... (first lob))
		      (fn-for-lob (rest lob))]))

;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Bool ListOfBoolean)
;; - self-reference: (rest lob) is ListOfBool

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of boolean values and produces true 
; if every value in the list is true. If the list is empty, your function 
; should also produce true. Call it all-true?
; 

;; ListOfBoolean -> Boolean
;; produce true if all elements of list are true, or list is empty. Otherwise, false
(check-expect (all-true? LOB-1) true)
(check-expect (all-true? LOB-2) true)
(check-expect (all-true? LOB-3) false)

;(define (all-true? lob) false) ; stub

(define (all-true? lob)
  (cond [(empty? lob) true] 
        [else (if (false? (first lob)) 
		      false 
		    (all-true? (rest lob)))]))


(test)

