;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (sqrt-iter old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
      new-guess
      (sqrt-iter new-guess (improve new-guess x) x)))

(define (good-enough? old-guess new-guess)
  (let ((guess-change (- 1 (/ (min (abs old-guess) (abs new-guess)) (max (abs old-guess) (abs new-guess))))))
    (< guess-change 0.001)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (sqrt-cube x)
  (sqrt-iter 0 1.0 x))