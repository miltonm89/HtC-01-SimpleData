;; water-balloon-solution.rkt
#lang htdp/bsl

(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

;;PROBLEM:
;;
;;In this problem, we will design an animation of throwing a water balloon.  
;;When the program starts the water balloon should appear on the left side 
;;of the screen, half-way up.  Since the balloon was thrown, it should 
;;fly across the screen, rotating in a clockwise fashion. Pressing the 
;;space key should cause the program to start over with the water balloon
;;back at the left side of the screen. 
;;
;;NOTE: Please include your domain analysis at the top in a comment box. 
;;
;;Use the following images to assist you with your domain analysis:
;;
;;Here is an image of the water balloon:
;;
;;NOTE: The rotate function wants an angle in degrees as its first 
;;argument. By that it means Number[0, 360). As time goes by your balloon 
;;may end up spinning more than once, for example, you may get to a point 
;;where it has spun 362 degrees, which rotate won't accept. 
;;
;;The solution to that is to use the modulo function as follows:
;;
;;(rotate (modulo ... 360) (text "hello" 30 "black"))
;;
;;where ... should be replaced by the number of degrees to rotate.
;;
;;NOTE: It is possible to design this program with simple atomic data, 
;;but we would like you to use compound data.
;;
;; ====== Domain Analysis ======
;; --- Constants ---
;;Width
;;Height
;;Center-y
;;empty scene
;;Starting position
;;Water balloon image
;;Water balloon speed
;;
;; --- Changing ---
;;Water balloon x position
;;Water balloon y position
;;Water balloon angle
;;
;; --- Big Bang options ---
;;on-tick
;;to-draw
;;on-key

;; My Water Balloon program

;; =================
;; Constants:
(define WIDTH 200)
(define HEIGHT 400)
(define CTR-Y (/ HEIGHT 2))
(define SPEED-X  5)
(define SPEED-Y  3)
(define SPEED-THETA 10)
(define BALLOON (ellipse 120 70 "outline" "green"))
  
(define MTS (empty-scene WIDTH HEIGHT))

;; =================
;; Data definitions:

(define-struct balloon (x y theta))
;; Balloon is (make-balloon Natural Natural Natural[0,360))
;; interp. (make-balloon x y theta) is a balloon with x and y coordinates and angle theta
;;   x is center of balloon in screen x coordinates (pixels)
;;   y is center of balloon in screen y coordinates (pixels)
;;   theta is angle of balloon in degrees
(define B1 (make-balloon 10 100 45))
(define B2 (make-balloon 50 50 (- 360 30)))

;;(define (fn-for-balloon b)
;;  (... (balloon-x b)      ; Natural
;;       (balloon-y b)      ; Natural
;;       (baloon-theta b)))   ; Natural[0,360)

;; Template rules used:
;;   - compound: 3 fields



;; =================
;; Functions:

;; Balloon -> Balloon
;; start the world with (main (make-balloon 0 CTR-Y 0))
;; 
(define (main b)
  (big-bang b                            ; Ballon
            (on-tick   next-balloon)     ; Balloon -> Balloon
            (to-draw   render-balloon)   ; Balloon -> Image
            (on-key    handle-key)))     ; Balloon KeyEvent -> Ballon

;; Balloon -> Balloon
;; increase balloon x coord. by SPEED-X, balloon y coord. by SPEED-Y, angle by SPEED-THETA
;; must account for angles > 360 but (rotate ...) can only handle [0, 360)
(check-expect (next-balloon (make-balloon 10             100             45))
                            (make-balloon (+ 10 SPEED-X) (+ 100 SPEED-Y) (+ 45 SPEED-THETA)))
(check-expect (next-balloon (make-balloon 50             50             (- 360 1)))
                            (make-balloon (+ 50 SPEED-X) (+ 50 SPEED-Y) (modulo (+ (- 360 1) SPEED-THETA) 360)))

;(define (next-balloon b) b) ; stub

; template from balloon
(define (next-balloon b)
  (make-balloon (+ (balloon-x b) SPEED-X)
                (+ (balloon-y b) SPEED-Y)
                (modulo (+ (balloon-theta b) SPEED-THETA) 360)))


;; Balloon -> Image
;; place appropriate balloon image on MTS at (balloon-x b) (balloon-y b) with (balloon-theta b)
(check-expect (render-balloon (make-balloon 10 100 45))
                              (place-image (rotate (modulo 45 360) BALLOON) 10 100 MTS))
(check-expect (render-balloon (make-balloon 50 50 330))
                              (place-image (rotate (modulo 330 360) BALLOON) 50 50 MTS))
;(define (render-balloon b) MTS) ; stub

; template from balloon
(define (render-balloon b)
  (place-image (rotate (modulo (balloon-theta b) 360) BALLOON)
               (balloon-x b)
               (balloon-y b) MTS))
               

;; Balloon KeyEvent -> Balloon
;; resetart balloon throw at original position when user preses spacebar
(check-expect (handle-key (make-balloon 10 100 45) " ") (make-balloon 0 CTR-Y 0))
(check-expect (handle-key (make-balloon 50 50 330) "w") (make-balloon 50 50 330))

;(define (handle-key b ke) b) ; stub

; template from balloon
(define (handle-key b ke)
  (cond [(key=? ke " ") (make-balloon 0 CTR-Y 0)]
        [else b]))
(test)
