#lang htdp/bsl
(require test-engine/racket-tests)

; PROBLEM
;
; Using the CityName Data definition below, design a function
; that produces true if the given city is the best in the world.
; (You are free to decide for yourself which is the best city in
; the world).

;; Data definitions:

;; CityName is a String.
;; interp. the name of a city
(define CN1 "Boston")
(define CN2 "Vancouver")
(define CN3 "Houston")
#;
(define (fn-for-cityname cn)
  (... cn))

;; Tempalte rules used:                  For the first part of the course
;; - atomic non-distinct                 we want you to list the template
;;                                       rules used after each template.

;; Functions:

;; CityName -> Boolean
;; produce true if the given city name is the best in the world
(check-expect (best? "Boston") false)
(check-expect (best? "Hogsmeade") true)

; (define (best? cn) false)    ;stub

(define (best? cn)
  (string=? cn "Hogsmeade"))

(test)
