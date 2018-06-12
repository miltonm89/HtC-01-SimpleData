#lang htdp/bsl

(require test-engine/racket-tests)

(check-expect true true)
(check-expect false false)
(check-expect false true)
(check-expect true false)

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


; Problem 2:
;
; Design a data definition called MonthAge to represent a person's age
; in months.


; Problem 3:
;
; Design a function called months-old that takes a person's age in years
; and yields that person's age in months.


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
;
; Design a function called increase-health that allows you to increase 
; the lives of a character. The function should only increase the lives
; of the character if the character is not head, otherwise the character
; remains dead.

(test)

