;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_27) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (fermat-test n)
  (let ((try-it (lambda (a)
                  (= (expmod a n n) a))))
    (try-it (+ 1 (random (- n 1) )))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square x)
  (* x x))

(define (timed-prime-test n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
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

;first 3 primes after 1000000000 is {1000000007:1, 1000000009:0, 1000000021:0} ~0.33ms
;first 3 primes after 10000000000 is {10000000019:1, 10000000033:0, 10000000061:0} ~0.33ms
;first 3 primes after 100000000000 is {100000000003:5, 100000000019:0, 100000000057:1} ~2ms
;first 3 primes after 1000000000000 is {1000000000039:0, 1000000000061:0, 1000000000063:1}~0.33ms

(timed-prime-test 561) ;#t
(timed-prime-test 1105);#t
(timed-prime-test 1729);#t
(timed-prime-test 2465);#t
(timed-prime-test 2821);#t
(timed-prime-test 6601);#t
; for each of those numbers current algorithm says that they are a prime numbers.

(define (full-test number)
  (ft-iter (- number 1) number))

(define (ft-iter current base)
  (cond ((= current 0) #t)
        (else (and (= (expmod current base base) current) (ft-iter (- current 1) base)))))


(display "FULL TEST")
(newline)
(full-test 3)
(full-test 4)
(full-test 17)
(full-test 27) 


(full-test 561) 
(full-test 1105)
(full-test 1729)
(full-test 2465)
(full-test 2821)
(full-test 6601)