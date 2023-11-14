#lang sicp

(define dx 0.00001)

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (cond ((= n 0) (lambda (x) (x)))
        ((= n 1) (lambda (x) (f x)))
        (else (repeated (compose f f) (dec n)))))

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (smoothn f n)
  (repeated (smooth f) n))