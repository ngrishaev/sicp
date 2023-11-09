#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (coef k)
    (cond ((= 0 k) 1)
          ((= n k) 1)
          ((odd? k) 4)
          (else 2)))
  (define (yk k)
    (f (+ a (* k h))))
  (define (term k)
    (* (coef k) (yk k)))
  (/ (* (sum term 0 inc n) h) 3))


(integral cube 1 10 0.00005)
(simpson-rule cube 1 10 100)