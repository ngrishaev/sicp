#lang sicp

(define (identity x) x)
(define (inc n) (+ n 1))

(define (prod-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (prod-rec term (next a) next b))))

(define (fac-rec a b)
  (prod-rec identity a inc b))

(define (prod-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (fac-iter a b)
  (prod-iter identity a inc b))

(define (pi/4 precision)
  (define (top k)
    (* 2 (floor (/ (+ k 2) 2))))
  (define (bottom k)
    (+ (top (- k 1)) 1))
  (define (f k)
    (/ (top k) (bottom k)))
  (exact->inexact (prod-iter f 1 inc precision)))
