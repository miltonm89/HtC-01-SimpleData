#lang htdp/bsl

(require test-engine/racket-tests)

;; demolish

;; Data Definitions:

; PROBLEM A:
; You are assigned to develop a system that will classify
; buidlings in downtown Vancouver based on how old they are.
; Accoding to city guidelines, there are three different classification levels:
; new, old, and heritage.
;
; Design a data definition to represent these classification levels.
; Call it BuidlingStatus

; BuildingStatus is one of:
; - "new"
; - "old"
; - "heritage"
; interp. as new, old, or heritage building status.
; <examples are redundant for enumeration>

#;
(define (fn-for-building-status bs)
  (cond [(string=? "new" bs) (...)]
	[(string=? "old" bs) (...)]
	[(string=? "heritage" bs) (...)]))
;; Template rules used:
;; - one of 3 cases:
;;     - atomic distinct: "new"
;;     - atomic distinct: "old"
;;     - atomic distinct: "heritage"

;; Functions:

; PROBLEM B:
; The city wants to demolish all buidlings classified as "old".
; You are hired to design a function called demolish?
; that determines whether a building should be torn down or not.

; BuildingStatus -> Boolean
; produce true if the building is "old" (should be demolished)
(check-expect (demolish? "new") false)
(check-expect (demolish? "old") true)
(check-expect (demolish? "heritage") false)

;(define (demolish? bs) true) ;stub

; Template from data definition of BuildingStatus
(define (demolish? bs)
  (cond [(string=? "new" bs) false]
	[(string=? "old" bs) true]
	[(string=? "heritage" bs) false]))
(test)
