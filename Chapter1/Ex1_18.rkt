;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_18) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (1+ x)
  (+ 1 x))

(define (1- x)
  (- x 1))

(check-expect (fast-mul 1 1) 1) ; 1 x 1 = 1
(check-expect (fast-mul 2 1) 2) ; 2 x 1 = 2
(check-expect (fast-mul 1 2) 2) ; 1 x 2 = 2
(check-expect (fast-mul 2 2) 4) ; 2 x 2 = 4
(check-expect (fast-mul 3 4) 12) ; 3 x 4 = 12
(check-expect (fast-mul 4 3) 12) ; 4 x 3 = 12
(check-expect (fast-mul 5 6) 30) ; 5 x 6 = 30
(check-expect (fast-mul 0 4) 0) ; 0 x 4 = 0
(check-expect (fast-mul 4 0) 0) ; 4 x 0 = 0
(check-expect (fast-mul 0 0) 0) ; 0 x 0 = 0
(check-expect (fast-mul -3 4) -12) ; -3 x 4 = -12
(check-expect (fast-mul 3 -4) -12) ; 3 x -4 = -12
(check-expect (fast-mul -3 -4) 12) ; -3 x -4 = 12
(define (fast-mul a b)
  (fast-mul-iter a b 0))

(define (fast-mul-iter a b accum)
  (cond ((= 0 b) accum)
        ((even? b) (fast-mul-iter (double a) (halve b) accum))
        ((> b 0) (fast-mul-iter a (1- b) (+ accum a)))
        ((< b 0) (fast-mul-iter a (1+ b) (- accum a)))
        ))