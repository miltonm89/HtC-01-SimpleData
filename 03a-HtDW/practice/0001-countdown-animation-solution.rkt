#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation-starter.rkt

;; PROBLEM:
;
; Design an animation of a simple countdown.
;
; Your program should display a simple countdown, that starts at ten, and
; decreases by one each clock tick until it reaches zero, and stays there.
;
; To make your countdown progress at a reasonable speed, you can use the
; rate option to on-tick. If you say, for example,
; (on-tick advance-countdown 1) then big-bang will wait 1 second between
; calls to advance-countdown.
;
; Rememeber to follow the HtDW recipe! Be sure to do a proper domain
; analysis before starting to work on the code file.
;
; Once you are finished the simple version of the program, you can improve
; by reseting the countdown to ten when you press spacebar.

; ==============
; Constants:
(define WIDTH 300)
(define HEIGHT 600)
(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define INITIAL 10)


; ==============
; Data Definitions:

; Countdown is a Number
; interp. as the current value of the countdown
(define CD1 10)
(define CD2 3)
(define CD3 0)

#;
(define (fn-for-cd cd)
  (... cd))

; Template rules used: 
; - atomic non-distinct: number

; ==============
; Functions:

;; Countdown -> Countdown 
;; start the world with (main 10)
;;
(define (main cd)
        (big-bang cd                    ; Countdown 
        (on-tick advance-countdown 1)   ; Countdown -> Countdown
        (to-draw render)                ; Countdown -> Image
        ;(on-mouse handle-mouse)        ; Countdown MouseEvent -> Countdown
        (on-key handle-key)))           ; Countdown KeyEvent -> Countdown

; Countdown -> Countdown
; produce next Countdown by 1 
(check-expect (advance-countdown CD1) 9)
(check-expect (advance-countdown CD2) 2)
(check-expect (advance-countdown CD3) 0)

; (define (advance-countdown cd) 0) ;stub

; <Template from Countdown>

(define (advance-countdown cd)
    (cond [(> cd 0) (- cd 1)]
	  (else cd)))

; Countdown -> Image
; render an image of the current number in the countdown
(check-expect (render CD1) (place-image (text (number->string CD1) 23 "Black") CTR-X CTR-Y MTS))
(check-expect (render CD2) (place-image (text (number->string CD2) 23 "Black") CTR-X CTR-Y MTS))
(check-expect (render CD3) (place-image (text (number->string CD3) 23 "Black") CTR-X CTR-Y MTS))

; (define (render cd) (place-image (text 0 23 "Black"))) ; stub

;<Template from Countdown>

(define (render cd)
  (place-image (text (number->string cd) 23 "Black") CTR-X CTR-Y MTS))

; Countdown KeyEvent -> Countdown
; when the user presses the spacebar, restart the countdown
(check-expect (handle-key CD2 " ") INITIAL)
(check-expect (handle-key CD2 "a") CD2)

; (define (handle-key CD3 ke) CD3) ; stub

; <Template from Countdown>
(define (handle-key cd ke)
  (cond [(string=? ke " ") INITIAL]
        [else cd]))

(test)
