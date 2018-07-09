#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)

; PROBLEM:
;
; Use the How to Design World recipe to design an interactive 
; program in which a cat starts at the left edge of the display
; and then walks across the screen to the right. When the cat 
; reaches the right edge it should just keep going right off 
; the screen.
; 
; Once your design is complete revise it to add a new feature,
; which is that pressing the space key should cause the cat to 
; go back to the left edge of the screen. When you do this, go
; all the way back to your domain analysis and incorporate the 
; new feature.
; 
; To help you get started, here is a picture of a cat, which we
; have taken from the 2nd edition of the How to Design Programs
; book on which this course is based.

; NOTE: due to this format, cat image is replaced.
;(define cat (text "Cat" 24 "Brown"))
(require 2htdp/image)
(require 2htdp/universe)

;; A cat that walks from left to right across the screen

;; =================
;; Constants:
(define WIDTH 600)
(define HEIGHT 400)

(define CTR-Y (/ HEIGHT 2))

(define MTS (empty-scene WIDTH HEIGHT "midnight blue"))
(define CAT-IMG (text "Cat" 24 "Brown"))

;; =================
;; Data definitions:

;; Cat is Number
;; interp. x position of the cat in screen coordinates
(define C1 0)           ; left edge
(define C2 (/ WIDTH 2)) ; middle
(define C3 WIDTH)       ; right edge

#;
(define (fn-for-cat c)
  (... c))
;; Template rules ised:
;; - atomic non-distinct: Number

;; ================
;; Functions:

;; Cat -> CAT 
;; start the world with ...
;;
(define (main c)
  (big-bang c                          ; CAT 
	    (on-tick    advance-cat)   ; CAT -> CAT 
	    (to-draw    render)))        ; CAT -> Images

;; CAT -> CAT 
;; produce the next Cat byt advncing it 1 pixel to the right 
(check-expect (advance-cat 3) 4)
;(define (advance-cat c) 0)  ; stub
;<use template from Cat>

(define (advance-cat c)
  (add1 c))

;; CAT -> Image
;; render the cat image at appropriate place on MTS
(check-expect (render 4) (place-image CAT-IMG 4 CTR-Y MTS))
; (define (render c) MTS) ; stub
;<use template from Cat>

(define (render c)
  (place-image CAT-IMG c CTR-Y MTS))

(test)
