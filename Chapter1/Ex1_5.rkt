;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (p)
  (p))

(define (test x y)
  (if (= x 0)
      0
      y))


;Applicative:
;(test 0 (p)) ->
;calculate (p) ->
;go to infinite recursion

;Normal:
;(test 0 (p))
;->
;(if (= x 0)
;    0
;    y)
;->
;(if (= 0 0)
;    0
;    y)
;->
;(if #t
;    0
;    y)
;->
;0