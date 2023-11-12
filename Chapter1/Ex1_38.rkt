#lang sicp

(define (cont-frac n d depth)
  (define (iter current)
    (display (d current))
    (display ", ")
    (cond ((= current depth) (/ (n current) (d current)))
          (else (/ (n current) (+ (d current) (iter (+ 1 current)))))))
  (iter 0))

(cont-frac
 (lambda (i) 1.0)
 (lambda (i)
   (cond ((= (modulo (+ i 2) 3) 0) (* 2 (/ (+ i 2) 3)))
         (else 1)))
 100)