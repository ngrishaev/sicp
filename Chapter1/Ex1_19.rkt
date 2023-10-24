;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (square x)
  (* x x))

(check-expect (fib 0) 0)
(check-expect (fib 1) 1)
(check-expect (fib 2) 1)
(check-expect (fib 3) 2)
(check-expect (fib 4) 3)
(check-expect (fib 5) 5)
(check-expect (fib 6) 8)
(check-expect (fib 7) 13)
(check-expect (fib 8) 21)
(check-expect (fib 9) 34)
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square q) (square p))
                   (+ (square q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))