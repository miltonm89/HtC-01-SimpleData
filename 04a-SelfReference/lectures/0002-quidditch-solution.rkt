#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)


;;PROBLEM:

;;Imagine that you are designing a program that will keep track of
;;your favorite Quidditch teams. (http://iqasport.org/).

;;Design a data definition to represent a list of Quidditch teams.
(define LOS1 empty)
(define LOS2 (cons "McGill" empty))
(define LOS3 (cons "UBC" (cons "McGill" empty)))

#;
(define (fn-for-los los)
    (cond [(empty? los) (...)]
          [else
           (... (first los)
                (rest los))]))

;; Template rules used:
;; - one of: 2 cases


;;PROBLEM:

;;We want to know whether your list of favorite Quidditch teams includes
;;UBC! Design a function that consumes ListOfString and produces true if 
;;the list includes "UBC".

;; ListOfString -> Boolean
;; prodce true if los includes "UBC"

(check-expect (contains-ubc? empty) false)
(check-expect (contains-ubc? (cons "McGill" empty)) false)
(check-expect (contains-ubc? (cons "UBC" emptu)) true)
(check-expect (contains-ubc? (cons "McGill" (cons "UBC" empty))) true)


(test)