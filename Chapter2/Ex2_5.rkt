#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car p)
  (define (iter current counter)
    (cond ((not (= 0 (modulo current 2))) counter)
          (else (iter (/ current 2) (+ 1 counter)))))
  (iter p 0))

(define (cdr p)
  (define (iter current counter)
    (cond ((not (= 0 (modulo current 3))) counter)
          (else (iter (/ current 3) (+ 1 counter)))))
  (iter p 0))