#lang htdp/bsl

(require test-engine/racket-tests)

; Verify check-expect is working in this format
(check-expect true true)
(check-expect false false)

;; HtDD Design Quiz
;
;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural

; Problem 1:
;
; Consider the above data definition for the age of a person.
;
; Design a function called teenager? that determines whether a person
; of a particular age is a teenager (i. e., between the ages of 13 and 19).
; Assuming 13 and 19 inclusive

; Age->Boolean
; Produces true if the given Age is in teenager interval, [13,19]
(check-expect (teenager? 1) false)
(check-expect (teenager? 13) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? A0) true)
(check-expect (teenager? A1) false)

; (define (teenager? a) true) ; stub
; <Template taken from Data Definition of Age>
(define (teenager? a)
  (and
    (>= a 13) 
    (<= a 19)))


; Problem 2:
;
; Design a data definition called MonthAge to represent a person's age
; in months.

;; MonthAge is Natural
;; interp. the age of a person in months 
(define A2 (* 12 18))
(define A3 (* 12 25))

#;
(define (fn-for-monthage m)
  (... m))

;; Template rules used:
;; - atomic non-distinct: Natural

; Problem 3:
;
; Design a function called months-old that takes a person's age in years
; and yields that person's age in months.

; Age->MonthAge
; Returns age in months (MonthAge) given age in years (Age)
(check-expect (months-old A0) A2)
(check-expect (months-old A1) A3)
(check-expect (months-old 0) 0)
(check-expect (months-old 1) 12)

; (define (months-old m) (* 12 m)) ; stub
; <Template taken from Data Definition for Age>
(define (months-old mo)
  (* 12 mo))

; Problem 4:
;
; Consider a video game where you need to represent the health of your
; character. The only thing that matters about their health is:
;
;     - if they are dead (which is shockingly poor health)
;     - if they are alive then they can have 0 or more extra lives
;
; Design a data definition called Health to represent the health of your
; character.

;; Health is one of:
;; - Natural
;; - "Dead"
;; interp. as dead or alive state, how many extra remaining lives
(define A4 "Dead")
(define A5 0)
(define A6 1)

#;
(define (fn-for-health h)
  (cond [(number? h ...) ...]
	[else (... h)]))

;; Template rules used:
;; -  Health is one of:
;;     - Atomic non-distinct: Natural
;;     - Atomic distinct: "Dead" 

; Design a function called increase-health that allows you to increase 
; the lives of a character. The function should only increase the lives
; of the character if the character is not head, otherwise the character
; remains dead.

; Health->Health
; increase lives by 1 if alive, else remain Dead
(check-expect (increase-health A4) A4)
(check-expect (increase-health A5) 1)
(check-expect (increase-health A6) 2)

; (define (increase-health h) "Dead") ; stub
; <Template taken from Data Definition for Health>
(define (increase-health h)
  (cond	[(number? h) (+ 1 h)]
	[else "Dead"]))

(test)
