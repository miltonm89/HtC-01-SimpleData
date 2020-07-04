#lang htdp/bsl
(require 2htdp/image)
(require 2htdp/universe)
(require test-engine/racket-tests)

(check-expect true true)
(check-expect false false)
;(check-expect true false)
;(check-expect false true)

;; PROBLEM:
;; 
;; Design a World Program with Compound Data. You can be as create as you like,
;; but keep it simple. Above all, follow the recipes! You must also stay within
;; the scope of the first part of the course. Do not use language features we 
;; have not seen in the videos.
;;
;; If you need inspiration, you can choose to create a program that allows you
;; to click on a spot on the screen to create a flower, which then grows over
;; time. If you click again the first flower is replaced by a new one at the 
;; new position.
;;
;; You should do all your design work in DrRacket. Following the step-by-step
;; recipe in DrRacket will help you be sure that you have a quality solution.
;;

;; Use (scale factor image) function to increase image size

;; ====== Domain Analysis ======
;; --- Constants ---
;;Width
;;Height
;;empty scene
;;Image scaling speed
;;Flower image (without scaling)
;;
;;
;; --- Changing ---
;;Flower start position
;;Flower scale factor
;;
;; --- Big Bang options ---
;;on-tick
;;to-draw
;;on-mouse

;; My world program  (make this more specific)

;; =================
;; Constants:

(define WIDTH 500)
(define HEIGHT 500)
(define MTS (empty-scene WIDTH HEIGHT))
(define SCALE-SPEED 0.1)

;; Flower drawing/image taken from Racket 2htdp/image documentation examples
;; First define a petal then overlay a bunch of them and a circle for image
(define PETAL (put-pinhole 20 20 (ellipse 100 40 "solid" "purple")))
(define FLOWER (clear-pinhole (overlay/pinhole
  (circle 30 "solid" "yellow")
  (rotate (* 60 0) PETAL)
  (rotate (* 60 1) PETAL)
  (rotate (* 60 2) PETAL)
  (rotate (* 60 3) PETAL)
  (rotate (* 60 4) PETAL)
  (rotate (* 60 5) PETAL))))

;; =================
;; Data definitions:

(define-struct flower (x y sf))
;; Flower is (make-flower Natural Natural Number)
;; interp. (make-flow x y sf) is a flower with coordinates x and y that scales sf
;;   x is center of flower in screen x coordinates (pixels)
;;   y is center of flower in screen y coordinates (pixels)
;;   sf is current scale factor of flower image
(define F1 (make-flower 200 200 1))
(define F2 (make-flower 300 100 1.1))

;;(define (fn-for-flower f)
;;  (... (flower-x f)      ; Natural
;;       (flower-y f)      ; Natural
;;       (flower-sf f)))   ; Number

;; Template rules used:
;;   - compound: 3 fields


;; =================
;; Functions:

;; Flower -> Flower
;; start the world with (main (make-flower 250 250 1))
;; 
(define (main f)
  (big-bang f                           ; Flower
            (on-tick   next-flower)     ; Flower -> Flower
            (to-draw   render-flower)   ; Flower -> Image
            (on-mouse  handle-click)))  ; Flower Integer Integer MouseEvent -> Flower

;; Flower -> Flower
;; produce the next Flower
(check-expect (next-flower F1)
              (make-flower (flower-x F1) (flower-y F1) (+ (flower-sf F1) SCALE-SPEED)))
(check-expect (next-flower F2)
              (make-flower (flower-x F2) (flower-y F2) (+ (flower-sf F2) SCALE-SPEED)))

;(define (next-flower f) f) ; stub

;; template taken from flower
(define (next-flower f)
  (make-flower (flower-x f)
       (flower-y f)
       (+ (flower-sf f) SCALE-SPEED)))


;; Flower -> Image
;; produce image with Flower imaged place on empty scene at proper coord. 
(check-expect (render-flower F1) (place-image
                                  (scale (flower-sf F1) FLOWER)
                                  (flower-x F1)
                                  (flower-y F1)
                                  MTS))
(check-expect (render-flower (make-flower
                              (flower-x F2)
                              (flower-y F2)
                              (flower-sf F2)))
                             (place-image
                              (scale (flower-sf F2) FLOWER)
                              (flower-x F2)
                              (flower-y F2)
                              MTS))

;(define (render-flower f) MTS) ; stub

;; template taken from flower
(define (render-flower f)
  (place-image (scale (flower-sf f) FLOWER)
               (flower-x f)
               (flower-y f)
               MTS))

;; Flower Integer Integer MouseEvent -> Flower
;; produce flower at mouse's current coordinates at time of click
(check-expect (handle-click (make-flower 10 100 1) 100 200 "button-down")
                            (make-flower 100 200 1))
(check-expect (handle-click (make-flower 10 100 0.9) 100 200 "button-up")
                            (make-flower 10 100 0.9))

(define (handle-click f x y me)
  (cond [(mouse=? me "button-down") (make-flower x y 1)]
        [else
         (make-flower (flower-x f) (flower-y f) (flower-sf f))]))

(test)
