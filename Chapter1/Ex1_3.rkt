;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(check-expect (square 1) 1)
(check-expect (square 2) 4)
(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))


(check-expect (max-square-sum 1 2 3) 13) 
(check-expect (max-square-sum 3 2 1) 13) 
(check-expect (max-square-sum 2 1 3) 13) 
(check-expect (max-square-sum -1 -2 -3) 5) 
(check-expect (max-square-sum 5 5 5) 50) 
(define (max-square-sum a b c)
  (cond ((= a (min a b c)) (sum-of-squares b c))
        ((= b (min a b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))