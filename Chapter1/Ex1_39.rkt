#lang sicp

(define (cont-frac n d depth)
  (define (iter current)
    (cond ((= current depth) (/ (n current) (d current)))
          (else (/ (n current) (+ (d current) (iter (+ 1 current)))))))
  (iter 0))

(define (tn-cf x k)
  (cont-frac
   (lambda (i) (if (= i 0) x (- (* x x))))
   (lambda (i) (+ (* 2 i) 1))
   k))

(tn-cf 5.0 100)
(tan 5)