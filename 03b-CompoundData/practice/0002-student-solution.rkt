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
;; Problem A:
;; Design a data definition to help a teacher organize their next field trip. 
;; On the trip, lunch must be provided for all students. For each student, track 
;; their name, their grade (from 1 to 12), and whether or not they have allergies.

(define-struct student (name lvl allergy))
;; Student is (make-student String Natural Bool)
;; interp. (make-student name lvl allergy) is a student with
;; - name is the student's name
;; - lvl is the student's grade level
;; - allergy is the student's allergic state
(define S1 (make-student "Milton" 9 true))
(define S2 (make-student "Rebecca" 10 false))
(define S3 (make-student "Daisy" 3 true))
(define S4 (make-student "Jaime" 4 false))

#;
(define (fn-for-student s)
  (... (student-name s)      ; String
       (student-lvl s)       ; Natural
       (student-allergy s))) ; Bool

;; Template rules used:
;; - compound data: 3 fields


;; =========================
;; Functions:
;;
;; Problem B:
;; To plan for the field trip, if students are in grade 6 or below, the teacher 
;; is responsible for keeping track of their allergies. If a student has allergies, 
;; and is in a qualifying grade, their name should be added to a special list. 
;; Design a function to produce true if a student name should be added to this list.

;; qualify-allergies
;; Student -> Bool
;; Input a student and check if student is in grade 6 or below and has allergies
;; Output true if both conditions are met, otherwise false
(check-expect (qualify-allergies S1) false)
(check-expect (qualify-allergies S2) false)
(check-expect (qualify-allergies S3) true)
(check-expect (qualify-allergies S4) false)

; (define (qualify-allergies s) false) ; stub

(define (qualify-allergies s)
  (and (<= (student-lvl s) 6) 
       (student-allergy s)))

;; <Template from Student>

(test)
