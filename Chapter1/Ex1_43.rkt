#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (cond ((= n 0) (lambda (x) (x)))
        ((= n 1) (lambda (x) (f x)))
        (else (repeated (compose f f) (dec n)))))

(define (square x)
  (* x x))

((repeated square 2) 5)