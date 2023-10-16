;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;recursive
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) (f (- n 2)) (f (- n 3))))))

;iterable
(define (f* n)
  (f*-iter 2 1 0 n))

(define (f*-iter a-1 a-2 a-3 count)
  (cond ((= count 0) a-3)
        (else (f*-iter (+ a-1 a-2 a-3) a-1 a-2 (- count 1)))))