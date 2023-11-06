;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_23) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (next x)
  (cond ((= 2 x) 3)
        (else (+ x 2))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))

(define (timed-prime-test n)
    (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (current-milliseconds) start-time))
      #f
      ))

(define (report-prime num elapsed-time)
  (begin
    (newline)
    (display num)
    (display " *** ")
    (display elapsed-time)
    #t))

(define (search-for-primes start end)
  (if (> start end)
      (display "Search ended")
      (proceed-and-increment start end)))

(define (proceed-and-increment start end)
  (begin
    (timed-prime-test start)
    (search-for-primes (+ 1 start) end)))

(define (get-first-three start count)
  (if (> count 2)
      (display "Search ended")
      (proceed-and-increment* start count)))

(define (proceed-and-increment* start count)
    (if (timed-prime-test start)
        (get-first-three (+ 1 start) (+ 1 count))
        (get-first-three (+ 1 start) count)))
      
(get-first-three 1000000000 0)
(get-first-three 10000000000 0)
(get-first-three 100000000000 0)
(get-first-three 1000000000000 0)

;first 3 primes after 1000000000 is {1000000007:4(13), 1000000009:7(6), 1000000021:3(6)} 4.66 vs 8.33
;first 3 primes after 10000000000 is {10000000019:14(18), 10000000033:12(19), 10000000061:14(113)} 13.3 vs 50
;first 3 primes after 100000000000 is {100000000003:46(71), 100000000019:44(57), 100000000057:139(154)} 76.3 vs 94 
;first 3 primes after 1000000000000 is {1000000000039:145(293), 1000000000061:249(276), 1000000000063:248(273)} 214.3 vs 280