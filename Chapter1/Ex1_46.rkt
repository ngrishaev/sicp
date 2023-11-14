#lang sicp

(define (iterative-improve check improve)
  (define (iter x)
    (if (check x)
        x
        (iter (improve x))))
  (lambda (x) (iter x)))
        
(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

;===

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-v2 f first-guess)
  (define (check x)
    (< (abs (- x (f x))) tolerance))
  ((iterative-improve check f) first-guess))
;===

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(define (sqrt-v2 x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))