#lang sicp
(define (f g)
  (g 2))

;===
;(f square)
;(square 2)
;4

;===
;(f (lambda (z) (* z (+ z 1))))
;((lambda (z) (* z (+ z 1))) 2)
;(* 2 (+ 2 1))
;(* 2 3)
;6

;===
;(f f)
;(f 2)
;((2 2) 2)
; There will be an error "application: not a procedure; expected a procedure that can be applied to arguments"
; If you unwind calls then you will receive ((2 2) 2). And you can calculate this expression, therefore an error