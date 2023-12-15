#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

;; double-starter.rkt

;; =================
;; Data definitions:

; 
; Remember the data definition for a list of numbers we designed in Lecture 5f:
; (if this data definition does not look familiar, please review the lecture)
; 


;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
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

;; =================
;; Functions:

; 
; PROBLEM:
; 
; Design a function that consumes a list of numbers and doubles every number 
; in the list. Call it double-all.
; 

;; ListOfNumber -> ListOfNumber
;; produces a list of number that is the input list but every element is doubled
(check-expect (double-all empty) empty)
(check-expect (double-all (cons 1 empty)) (cons 2 empty))
(check-expect (double-all LON2) (cons 120 (cons 84 empty)))

;(define (double-all lon) empty) ;stub

(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* 2 (first lon))
              (double-all (rest lon)))]))


(test)
