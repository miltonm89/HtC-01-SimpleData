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

(define WIDTH 400)
(define HEIGHT 400)

(define CTR-Y (/ HEIGHT 2))

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
  (big-bang c                ; Cat
       (on-tick advance-cat) ; Cat -> Cat
       (to-draw render)))    ; Cat -> Image

;; Cat -> Cat
;; produce the next cat, by advancing it 1 pixel to right
(check-expect (advance-cat 3) 4)

; (define advance-cat c) 0) ; stub

; <use template form Cat>

(define (advance-cat c)
  (+ c 1))


;; Cat -> Image
;; render the cat image at appropriate place on MTS
(check-expect (render 4) (place-image CAT-IMG 4 CTR-Y MTS))

; (define (render c) MTR) ; stub

; <use template from Cat>

(define (render c)
  (place-image CAT-IMG c CTR-Y MTS))

(test)
