#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define pair (cons 1 2))
(car pair)

;(define pair2 (cons 1 2))
;(define pair2 (lambda (m) (m 1 2)))
;(car pair2)
;((lambda (m) (m 1 2)) (lambda (p q) p))
;((lambda (p q) p) 1 2)
;(lambda (1 2) 1)
;1