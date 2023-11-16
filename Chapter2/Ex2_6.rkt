#lang sicp

(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (sum a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;===
;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f x)))

; Church number - how many times f function was called on x.
; So zero calls f zero times,
; One called f one time
; Two called f two times etc.

