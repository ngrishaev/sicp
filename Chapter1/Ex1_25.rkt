(define (fermat-test n)
  (let ((try-it (lambda (a)
                  (= (expmod a n n) a))))
    (try-it (+ 1 (random (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(define (fast-prime? n times)
  (begin
    (display "Fast prime test!")
    (newline)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false))))

(define (square x)
  (* x x))

(define (timed-prime-test n)
    (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 20)
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

(get-first-three 100000 0)

; This version is much slower. The cause I belive is becouse we calculate very long numbers there, and calculation with long numbers is slow.
; In previous version we call reminder on each recursive call, so we dont have to deal with big number such oftern.