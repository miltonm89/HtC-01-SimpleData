#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)

(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt

;; PROBLEM:
; Design an animation of a traffic light.
;
; Your program should show a traffic light that is red, then green,
; then yellow, then red etc. For this program, your changing world
; state data definition should be an enumeration.
;
; Here is what your program might look like if the initial world state was the red traffic light:
; RED
; (underlay (rectangle 50 130 "solid" "black")
;     (above (circle 20 "solid" "red")
;            (circle 20 "outline" "yellow")
;            (circle 20 "outline" "green")))
;
; GREEN
; (underlay (rectangle 50 130 "solid" "black")
;     (above (circle 20 "outline" "red")
;            (circle 20 "outline" "yellow")
;            (circle 20 "solid" "green")))
;
; YELLOW
; (underlay (rectangle 50 130 "solid" "black")
;     (above (circle 20 "outline" "red")
;            (circle 20 "solid" "yellow")
;            (circle 20 "outline" "green")))
;
; Next is red, and so on.
;
; To make your lights change at a reasonable speed, you can use the
; rate option to on-tick. If you say, for example, (on-tick next-color 1)
; then big-bang will wait 1 second between calls to next-color.
;
; Remember to follow the HtDW recipe! Be sure to do a proper domain 
; analysis before starting to work on the code file.
; 
; Note: If you want to design a slightly simpler version of the program,
; you can modify it to display a single circle that changes color, rather
; than three stacked circles.

; ===============
; Constants: 
(define HEIGHT 600)
(define WIDTH 300)
(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))

(define RED-LIGHT 
  (underlay (rectangle 50 130 "solid" "black")
     (above (circle 20 "solid" "red")
            (circle 20 "outline" "yellow")
            (circle 20 "outline" "green"))))
(define GREEN-LIGHT 
  (underlay (rectangle 50 130 "solid" "black")
     (above (circle 20 "outline" "red")
            (circle 20 "outline" "yellow")
            (circle 20 "solid" "green"))))
(define YELLOW-LIGHT 
  (underlay (rectangle 50 130 "solid" "black")
     (above (circle 20 "outline" "red")
            (circle 20 "solid" "yellow")
            (circle 20 "outline" "green"))))

; ===============
; Data Definitions:

; Traffic is one of:
; - "red"
; - "green"
; - "yellow"
; interpret as the currently lit traffic light

; <examples redundnat for enumeration>

#;
(define (fn-for-traffic t)
  (cond [(string=? "red" t) (...)]
	[(string=? "green" t) (...)]
	[(string=? "yellow" t) (...)]))

; Template rules used:
; - one of: 3 cases
; - atomic distinct: "red"
; - atomic distinct: "green"
; - atomic distinct: "yellow"

; ==============
; Functions:

;; Traffic -> Traffic 
;; start the world with (main "red")
;;
(define (main t)
        (big-bang t                    ; Traffic 
        (on-tick advance-traffic 1)    ; Traffic -> Traffic 
        (to-draw render)))             ; Traffic -> Image

; advance-traffic
; Traffic -> Traffic
; produce next traffic state
(check-expect (advance-traffic "red") "green")
(check-expect (advance-traffic "green") "yellow")
(check-expect (advance-traffic "yellow") "red")

; (define (advance-traffic t) "red") ; stub

; <template from Traffic>

(define (advance-traffic t)
  (cond [(string=? "red" t) "green"]
	[(string=? "green" t) "yellow"]
	[(string=? "yellow" t) "red"]))

; render
; Traffic -> Image
; render an image of the current traffic state
(check-expect (render "red") RED-LIGHT)
(check-expect (render "green") GREEN-LIGHT)
(check-expect (render "yellow") YELLOW-LIGHT)

;(define (render t) RED-LIGHT) ; stub

; <template from Traffic>

(define (render t)
  (cond [(string=? "red" t) RED-LIGHT]
	[(string=? "green" t) GREEN-LIGHT]
	[(string=? "yellow" t) YELLOW-LIGHT]))

(test)
