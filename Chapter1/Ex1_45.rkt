#lang sicp

(define tolerance 0.00001)
(define dx 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "New try: ")
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (cond ((= n 0) (lambda (x) (x)))
        ((= n 1) (lambda (x) (f x)))
        (else (repeated (compose f f) (dec n)))))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (nth-root x nth)
  (fixed-point
   ((repeated average-damp (floor (log nth 2)))
    (lambda (y)
      (/ x (fast-expt y (- nth 1)))))
   1.0))