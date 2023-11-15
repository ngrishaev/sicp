#lang sicp

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
(define (midpoint-segment s)
  (make-point (+ (x-point (start-segment s)) (/ (- (x-point (end-segment s)) (x-point (start-segment s))) 2))
              (+ (y-point (start-segment s)) (/ (- (y-point (end-segment s)) (y-point (start-segment s))) 2))))


(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define start1 (make-point 0 0))
(define end1 (make-point 4 4))
(define segment1 (make-segment start1 end1))
(print-point (midpoint-segment segment1))

(define start2 (make-point 0 0))
(define end2 (make-point 1 4))
(define segment2 (make-segment start2 end2))
(print-point (midpoint-segment segment2))

(define start3 (make-point 0 0))
(define end3 (make-point 4 0))
(define segment3 (make-segment start3 end3))
(print-point (midpoint-segment segment3))