#lang htdp/bsl

(require test-engine/racket-tests)
(require 2htdp/image)

; rocket

; Data Definitions:

; PROBLEM A:
; You are designing a program to track a rocket's journey as it descends
; 100 kilometers to Earth. You are only interested in the descent from
; 100 kilometers to touchdown. Once the rocket has landed it is done.
;
; Design a data definition to represent the rocket's remaining descent.
; Call it RocketDescent.

; RocketDescent is one of:
; - Number(0,100]
; - false
; interp. the number of kilometers to Earth, or the rocket has landed
(define RD1 100)
(define RD2 29.3)
(define RD3 false)

#;
(define (fn-for-rocket-descent rd)
  (cond [(and (number? rd)
	      (< 0 rd)
	      (<= rd 100))
	 (... rd)]
	[else (...)]))

;; Template rules used:
;; - one of: 2 cases:
;;     - atomic non-distinct: Number(0,100]
;;     - atomic distinct: false

; Functions:

; PROBLEM B:
; Design a function that will output the rocket's remaining descent distance
; in a short string that can be broadcast on Twitter.
; When the descent is over, the message should be "The rocket has landed!".
; Call you function rocket-descnent-to-msg.

; RocketDescent -> String
; produce a string that displays the remaining descent distance
(check-expect (rocket-descent-to-msg RD1) (string-append (number->string RD1) " kilometers to Earth"))
(check-expect (rocket-descent-to-msg RD2) (string-append (number->string RD2) " kilometers to Earth"))
(check-expect (rocket-descent-to-msg RD3) "The rocket has landed!")

;(define (rocket-descent-to-msg rd) (number->string RD1)) ; stub

; <Template from RocketDescent data definition>
(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd)
	      (< 0 rd)
	      (<= rd 100))
	 (string-append (number->string rd) " kilometers to Earth")]
	[else "The rocket has landed!"]))
;; 
(test)

