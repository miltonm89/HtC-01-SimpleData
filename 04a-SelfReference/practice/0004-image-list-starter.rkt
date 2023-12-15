#lang htdp/bsl
(require 2htdp/image)


(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;(check-expect false true)
;(check-expect true false)
;; image-list-starter.rkt

(define image1 (circle 10 "solid" "green"))
(define image2 (rectangle 10 20 "solid" "blue"))
(define image3 (star 12 "solid" "gray"))

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of images. Call it ListOfImage. 
; 

;; ListOfImage is one of:
;; - empty
;; - (cons Image ListofImage)
;; interp. a list of images
(define LOI1 empty)
(define LOI2 (cons image1 empty))
(define LOI3 (cons image1 (cons image2 (cons image3 empty))))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
		  (... (first loi)
		       (fn-for-loi (rest loi)))]))

;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Image ListOfImage)
;; - self-reference: (rest loi) is ListOfImage

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of images and produces a number 
; that is the sum of the areas of each image. For area, just use the image's 
; width times its height.
; 
(check-expect (sum-of-area LOI1) 0)
(check-expect (sum-of-area LOI2) (* (image-width image1) (image-height image1)))
(check-expect (sum-of-area LOI3) (+ 
                                    (* (image-width image1) (image-height image1))
                                    (* (image-width image2) (image-height image2))
                                    (* (image-width image3) (image-height image3))
                                 ))

;;(define (sum-of-area loi) 0) ; stub

(define (sum-of-area loi)
  (cond [(empty? loi) 0]
        [else
		  (+ (* (image-width  (first loi))
		        (image-height (first loi)))
		     (sum-of-area (rest loi)))]))

(test)
