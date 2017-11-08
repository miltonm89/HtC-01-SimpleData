#lang htdp/bsl

(require test-engine/racket-tests)

; this function has little information
; (define (next-color c)
;   (cond [(= c 0) 2]
; 	[(= c 1) 0]
; 	[(= c 2) 1]))

;; What if it instead followed the HtDF recipe?
;; Natural -> Natural
;; produce next color of traffic light.
;(check-expect (next-color 0) 2)
;(check-expect (next-color 1) 0)
;(check-expect (next-color 2) 1)

; (define (next-color c) 0) ;stub

; (define (next-color c)    ;template
;   (... c))

;(define (next-color c)
;  (cond [(= c 1) 2]
;	[(= c 1) 0]
;	[(= c 2) 1]))


; But how do we prevent user from inputing something
; like 3? That would fit the function definition but
; return an error because it's not handled.

;; Data definitions:
;
;; TLColor is one of:
;; - 0
;; - 1
;; - 2
;; interp. 0 means red, 1 means yellow, 2 means green
#;
(define (fn-for-tlcolor c)
  (cond [(= c 0) (...)]
	[(= c 1) (...)]
	[(= c 2) (...)]))

;; Functions

;; TLColor -> TLColor
;; produce next color of traffic light
;(check-expect (next-color 0) 2)
;(check-expect (next-color 1) 0)
;(check-expect (next-color 2) 1)

; (define (next-color c) 0) ;stub

; Template form TLColor

;(define (next-color c)
;  (cond [(= c 0) 2]
;	[(= c 1) 0]
;	[(= c 2) 1]))

;; One more change to the Data Definition to clarify the function's purpose.
;; A small part of a traffic simulation.

;; Data definitions:

;; TLColor is one of :
;; - "red"
;; - "yellow"
;; - "green"
;; interp. "red" means red, "yellow" means yellow, "green" means green
#;
(define (fn-for-tlcolor c)
  (cond [(string=? c "red") (...)]
	[(string=? c "yellow") (...)]
	[(string=? c "green") (...)]))

;; Functions

;; TLColor -> TLColor
;; produce the next color of traffic light
(check-expect (next-color "red") "green")
(check-expect (next-color "yellow") "red")
(check-expect (next-color "green") "yellow")

; (define (next-color c) "red") ;stub

; Template from TLColor

(define (next-color c)
  (cond [(string=? c "red") "green"] 
	[(string=? c "yellow") "red"] 
	[(string=? c "green") "yellow"])) 

(test)
