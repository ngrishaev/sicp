;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

;This procedure uses if that returns an operator as result. 
;So, if condition is true (if b positive) than if returns "+" operator, otherwise "-" operator.
;Therefore we can change operator that we apply to this arguments in runtime.
