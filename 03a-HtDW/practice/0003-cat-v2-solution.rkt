#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
(check-expect false true)
(check-expect true false)

(require 2htdp/image)
(require 2htdp/universe)

;; cat-v1.rkt

;; A cat that walks from left to right across the screen

;; ================
;; Constants:

(define WIDTH 600)
(define HEIGHT 400)

(define CTR-Y (/ HEIGHT 2))

(define SPEED 3)

(define MTS (empty-scene WIDTH HEIGHT))

(define CAT-IMG (text "CAT" 23 "Black"))

;; ================
;; Data definitions:

;; Cat is Number
;; interp. x position of the cat in screen coordinates
(define C1 0)           ; left edge
(define C2 (/ WIDTH 2)) ; middle
(define C3 WIDTH)       ; right edge

#;
(define (fn-for-cat c)
  (... c))

;; Template rules used: 
;;  - atomic non-distinct: Number

;; ===============
;; Functions:

;; Cat -> Cat
;; start the world with (main 0)
;;
(define (main c)
  (big-bang c                  ; Cat
       (on-tick advance-cat)   ; Cat -> Cat
       (to-draw render)        ; Cat -> Image
       (on-mouse handle-mouse) ; Cat MouseEvent -> Cat
       (on-key handle-key)))   ; Cat KeyEvent -> Cat

;; Cat -> Cat
;; produce the next cat, by advancing it SPEED pixel(s) to right
(check-expect (advance-cat 3) (+ 3 SPEED))

; (define advance-cat c) 0) ; stub

; <use template form Cat>

(define (advance-cat c)
  (+ c SPEED))


;; Cat -> Image
;; render the cat image at appropriate place on MTS
(check-expect (render 4) (place-image CAT-IMG 4 CTR-Y MTS))

; (define (render c) MTR) ; stub

; <use template from Cat>

(define (render c)
  (place-image CAT-IMG c CTR-Y MTS))

;; Cat KeyEvent ->  Cat
;; reset cat to left edge when space key is preseed
(check-expect (handle-key 10 " ") 0)
(check-expect (handle-key 10 "a") 10)
(check-expect (handle-key 0 " ") 0)
(check-expect (handle-key 0 "a") 0)

;(define (handle-key c ke) 0) ; stub

(define (handle-key c ke)
  (cond [(key=? ke " ") 0]
	[else c]))

;; Cat MouseEvent -> Cat
;; move Cat to current mouse x position when button clicked
(check-expect (handle-mouse 10 20 10 "button-down") 20)
(check-expect (handle-mouse 10 20 10 "button-up") 10)
(check-expect (handle-mouse 10 10 10 "button-down") 10)
(check-expect (handle-mouse 10 10 10 "button-up") 10)

;(define (handle-mouse c x y me) 0) ; stub

(define (handle-mouse c x y me)
  (cond [(mouse=? me "button-down") x]
	[else x]))
(test)
