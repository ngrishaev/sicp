;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_22) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (begin
    (display "Find divisor")
    (newline)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1))))))

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

(define (get-first-three start count)
  (if (> count 2)
      (display "Search ended")
      (proceed-and-increment* start count)))

(define (proceed-and-increment* start count)
  (begin
    (display "Proceed ")
    (display start)
    (newline)
    (if (timed-prime-test start)
        (get-first-three (+ 1 start) (+ 1 count))
        (get-first-three (+ 1 start) count))))

;(get-first-three 1000 0)

(get-first-three 100000 0)
;(get-first-three 1000000000 0)
;(get-first-three 10000000000 0)
;(get-first-three 100000000000 0)
;(get-first-three 1000000000000 0)
  
;first 3 primes after 1000 is {1009, 1013, 1019}
;first 3 primes after 10 000 is {10007, 10009, 10037}
;first 3 primes after 100 000 is {100003, 100019, 100043}
;first 3 primes after 1 000 000 is {1000003, 1000033, 1000037}
;======
;first 3 primes after 1000000000 is {1000000007:13, 1000000009:6, 1000000021:6} ~8.33ms
;first 3 primes after 10000000000 is {10000000019:18, 10000000033:19, 10000000061:113} ~50ms
;first 3 primes after 100000000000 is {100000000003:71, 100000000019:57, 100000000057:154} ~94 ms
;first 3 primes after 1000000000000 is {1000000000039:293, 1000000000061:276, 1000000000063:273}~280ms