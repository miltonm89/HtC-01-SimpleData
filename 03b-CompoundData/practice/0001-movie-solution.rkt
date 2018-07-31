#lang htdp/bsl

(require test-engine/racket-tests)

; Check that check-expect is working in this format
(check-expect true true)
(check-expect false false)
;; (check-expect false true)
;; (check-expect true false)


;; =========================
;; Data definitions:
;;
;; PROBLEM A:
;; Design a data definition to represent a movie, including  
;; title, budget, and year released.
;;
;; To help you to create some examples, find some interesting movie facts below: 
;; "Titanic" - budget: 200000000 released: 1997
;; "Avatar" - budget: 237000000 released: 2009
;; "The Avengers" - budget: 220000000 released: 2012
;; 
;; However, feel free to resarch more on your own!

(define-struct movie (title budget year))
;; movie is (make-movie String Number Number)
;; interp. (make-movie title budget year) is a movie with
;;     - title is the title of the movie
;;     - budget is the movie's budget
;;     - year is the movie's release year
(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar"  237000000 2009))
(define M3 (make-movie "The Avengers" 220000000 2012))

(define (fn-for-movie m)
  (... (movie-title m)   ; String
       (movie-budget m)  ; Number
       (movie-year m)))  ; Number

;; Template rules used:
;; - Compound data: 3 fields

;; =========================
;; Functions: 
;;
;; Problem B:
;; You have a list of movies you want to watch, but you like to watch your 
;; rentals in chronological order. Design a function that consumes two movies 
;; and produces the title of the most recently released movie.
;; 
;; Note that the rule for templating a function that consumes two compound data 
;; parameters is for the template to include all the selectors for both 
;; parameters.

;; Movie Movie -> String
(check-expect (chrono M1 M2) (movie-title M1))
(check-expect (chrono M1 M3) (movie-title M1))
(check-expect (chrono M3 M2) (movie-title M2))

;(define (chrono movie1 movie2) movie1) ; stub

; <Template from Movie>
#;
(define (fn-for-movie m1 m2)
  (... (movie-title m1)   ; String
       (movie-budget m1)  ; Number
       (movie-year m1)    ; Number
       (movie-title m2)   ; String
       (movie-budget m2)  ; Number
       (movie-year m2)))  ; Number

(define (chrono movie1 movie2)
  (cond [(< (movie-year movie1) (movie-year movie2)) 
	    (movie-title movie1)]
	[else (movie-title movie2)]))


(test)
