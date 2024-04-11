#lang htdp/bsl

(require test-engine/racket-tests)
(require 2htdp/image)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

;; 001-alternative-tuition-graph-starter.rkt

;; Consider the following alternative type comment for Eva's school tuition 
;; information program. Note that this is just a single type, with no reference, 
;; but it captures all the same information as the two types solution in the 
;; videos.
;;
;; (define-struct school (name tuition next))
;; School is one of:
;;  - false
;;  - (make-school String Natural School)
;; interp. an arbitrary number of schools, where for each school we have its
;;         name and its tuition in USD
;;
;; (A) Confirm for yourself that this is a well-formed self-referential data 
;;    definition.
;;
;; (B) Complete the data definition making sure to define all the same examples as 
;;    for ListOfSchool in the videos.
;;
;; (C) Design the chart function that consumes School. Save yourself time by 
;;    simply copying the tests over from the original version of chart.
;;
;; (D) Compare the two versions of chart. Which do you prefer? Why?