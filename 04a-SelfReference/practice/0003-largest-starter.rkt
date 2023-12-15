#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

;; largest-starter.rkt

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
(define LON3 (cons 60 (cons 120 empty)))

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
; Design a function that consumes a list of numbers and produces the largest number 
; in the list. You may assume that all numbers in the list are greater than 0. If
; the list is empty, produce 0.
; 
;; ListOfNumbers -> Number
;; produce the largest number in a list of numbers
(check-expect (largest LON1) 0)
(check-expect (largest LON2) 60)
(check-expect (largest LON3) 120)

;(define (largest lon) 0) ; stub

; check if list is empty, return 0
; check if list is 1 item ((rest lon) is empty), return first item
; check if first item > second item
; - if true, call largest on list that excludes second item
; - if false, call largest on list that exludes first item
(define (largest lon)
  (cond [(empty? lon) 0]          ; if list is empty, return 0
        [else
          (if (empty? (rest lon)) ; if list is only 1 item
              (first lon)         ; return first item
              (if (> (first lon) (first (rest lon)))          ; if first item > second item 
                (largest 
				  (cons (first lon) (rest (rest lon)))
				)                                             ; largest called on list without second item
                (largest 
				  (rest lon) ; largest called on list w/o first item
				)
			  )
	      )
		]
  )
)



(test)
