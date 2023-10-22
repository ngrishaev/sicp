;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_16) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (square x)
  (* x x))

; Check exponentiation for some basic cases
(check-expect (fast-expt 2 0) 1) ; Any non-zero number to the power of 0 is 1
(check-expect (fast-expt 2 1) 2) ; 2^1 = 2
(check-expect (fast-expt 2 2) 4) ; 2^2 = 4
(check-expect (fast-expt 2 3) 8) ; 2^3 = 8
(check-expect (fast-expt 2 4) 16) ; 2^4 = 16
(check-expect (fast-expt 2 5) 32) ; 2^5 = 32
(check-expect (fast-expt 2 11) 2048) ; 2^11 = 2048
(check-expect (fast-expt 3 3) 27) ; 3^3 = 27
(check-expect (fast-expt 5 0) 1) ; 5^0 = 1
(check-expect (fast-expt 5 2) 25) ; 5^2 = 25
(define (fast-expt b n)
  (fast-expt-iteration b n 1))

(define (fast-expt-iteration base counter product)
  (cond ((= 0 counter) product)
        ((odd? counter) (fast-expt-iteration base (- counter 1) (* base product)))
        (else (fast-expt-iteration (square base) (/ counter 2) product))))