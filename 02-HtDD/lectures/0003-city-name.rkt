#lang htdp/bsl

(require test-engine/racket-tests)
; PROBLEM
;
; Imagine that you are designing a program that, among other things,
; has information about the names of cities in its problem domain.
;
; Design a data definition to represent the ane of a city.

; Information      Data
; Vancouver        "Vancouver"
; Boston           "Boston

;; CityName is String
;; interp. the name of a city
(define CN1 "Boston")
(define CN2 "Vancouver")

#;
(define (fn-for-cityname cn)
  (... cn))

;; Template rules used:
;; - atomic non-disting: String
(test)
