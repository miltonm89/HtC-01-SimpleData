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
(define cat (text "Cat" 24 "Brown"))

;; =================
;; Data definitions:

;; WS is ... (give WS a better name)


;; ================
;; Functions:

;; WS -> WS
;; start the world with ...
;;
(define (main ws)
  (big-bang ws                  ; WS
	    (on-tick    tock)   ; WS -> WS
	    (to-draw    render) ; WS -> Images
	    (stop-when  ...)    ; WS -> Boolean
	    (on-mouse   ...)    ; WS Integer Integer MouseEvent -> WS
	    (on-key     ...)))  ; WS KeyEvent -> WS

;; WS -> WS
;; produce the next ...
;; !!!
(define (tock ws) ...)

;; WS -> Image
;; render ...
;; !!!
(define (render ws) ...)

(test)
