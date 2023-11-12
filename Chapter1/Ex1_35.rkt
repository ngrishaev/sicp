#lang sicp

; phi = 1 + 1/phi
; phi = (1 + sqrt(5)) / 2
; (1 + sqrt(5)) / 2 = 1 + 2/(1 + sqrt(5)) 
; (1 + sqrt(5)) / 2 = (3 + sqrt(5))/(1 + sqrt(5))    | multiply by 2 * (1 + sqrt(5))
; (1 + sqrt(5)) ^ 2 = 2 * (3 + sqrt(5))
; 1 + 2 * sqrt(5) + sqrt(5)^2 = 6 + 2 * sqrt(5)
; 1 + 2 * sqrt(5) + 5 = 6 + 2 * sqrt(5)
; 6 + 2 * sqrt(5) = 6 + 2 * sqrt(5)

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

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)