(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (< (abs angle) 0.1)
      angle
      (p (sine (/ angle 3.0)))))

;From the calltree (Ex1_15_calltree.png) is obvious that in space and time grow rate is linear (n);
