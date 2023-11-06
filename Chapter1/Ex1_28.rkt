;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_28) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder* (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin n)
  (let ((try-it (lambda (a)
                  (= (expmod a (- n 1) n) 1))))
    (try-it (+ 1 (random (- n 1))))))

(define (miller-rabin? n times)
  (cond ((= times 0) #t)
        ((miller-rabin n)
         (miller-rabin? n (- times 1)))
        (else #f)))

(define (remainder* x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(miller-rabin? 4 10) ; #f
(miller-rabin? 9 10) ; #t
(miller-rabin? 5 10) ; #t
(miller-rabin? 13 10) ; #t
(miller-rabin? 27 10) ; #t

(miller-rabin? 561 10) 
(miller-rabin? 1105 10)
(miller-rabin? 1729 10)
(miller-rabin? 2465 10)
(miller-rabin? 2821 10)
(miller-rabin? 6601 10)