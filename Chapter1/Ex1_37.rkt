#lang sicp

(define (cont-frac n d depth)
  (define (iter current)
    (cond ((= current depth) (/ (n current) (d current)))
          (else (/ (n current) (+ (d current) (iter (+ 1 current)))))))
  (iter 0))

(define (cont-frac-iter n d depth)
  (define (iter current result)
    (cond ((= current 1) (/ (n current) (+ (d current) result)))
          (else (iter (- current 1) (/ (n current) (+ (d current) result))))))
  (iter depth (/ (n depth) (+ (d depth)))))
