#lang sicp

(define (filtered filter combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) (combiner result null-value)))))
  (iter a null-value))

(define (no-filter x)
  #true)

(define (accumulate combiner null-value term a next b)
  (filtered no-filter combiner null-value term a next b))
;========
(define (squared-primes a b)
  (filtered fast-prime? + 0 square a inc b))

;========
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (coprime? a b)
  (= 1 (gcd a b)))

(define (prod-coprime a b)
  (filtered (coprime? * 1 identity a inc b)))

;========
(define (square x)
  (* x x))

(define (fermat-test n)
  (let ((try-it (lambda (a)
                  (= (expmod a n n) a))))
    (try-it (+ 1 (random (modulo (- n 1) 4294967087))))))

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


(define (fast-prime? n)
  (define (iter n times)
    (begin
      (cond ((= times 0) #true)
            ((= n 1) #false)
            ((fermat-test n) (iter n (- times 1)))
            (else #false))))
  (iter n 10))

;========
(define (prod term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (identity x) x)
(define (inc n) (+ n 1))
(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)

(define (fac a b)
  (prod identity a inc b))
(fac 3 5)