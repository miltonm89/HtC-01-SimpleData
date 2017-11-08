#lang htdp/bsl
(require test-engine/racket-tests)

; PROBLEM
; Image that you are designing a program to manage ticket sales for a
; theatre. (Also image that the theatre is oerfectly rectangular in shape!)
;
; Design a data definition to represent a seat number in a row, where each
; row has 32 seats. (Just the seat number, not the row number.)

(check-expect true true)
(check-expect false false)
(check-expect false true)

(test)
