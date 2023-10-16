;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;a_n = 2n
(define (f n) (A 0 n))
;a_n = 2^n
(define (g n) (A 1 n))
;a_n = 2^(a_n); a_1 = 2; a_0 = 0;
(define (h n) (A 2 n))
;a_n = n*n
(define (k n) (* 5 n n))