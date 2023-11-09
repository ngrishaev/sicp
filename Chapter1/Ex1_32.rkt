#lang sicp

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
            (accumulate-rec combiner null-value term (next a) next b))))

(define (prod-rec term a next b)
  (accumulate-rec * 1 term a next b))

(define (sum-rec term a next b)
  (accumulate-rec + 0 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (prod-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

;===
(define (identity x) x)
(define (inc n) (+ n 1))
(define (cube x)
  (* x x x))

(define (sum-cubes-rec a b)
  (sum-rec cube a inc b))

(sum-cubes-rec 1 10)

(define (fac-rec a b)
  (prod-rec identity a inc b))
(fac-rec 3 5)

(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))

(sum-cubes-iter 1 10)

(define (fac-iter a b)
  (prod-iter identity a inc b))
(fac-iter 3 5)