(define (pascal n)
  (cond ((= 0 n) '((1)))
        ((= 1 n) '((1) (1 1)))
        (else (append (pascal (- n 1)) (list (pascal-row (last (pascal (- n 1))) n))))))

(define (pascal-row prow n)
  (pascal-row-iter prow n n))

(define (pascal-row-iter prow index n)
  (cond ((= index 0) '(1))
        ((= index n) (append (pascal-row-iter prow (- index 1) n) '(1)))
        (else (append (pascal-row-iter prow (- index 1) n) (list (+ (list-ref prow (- index 1)) (list-ref prow index)))))))

(define (last lst)
  (if (null? (cdr lst))
      (car lst)
      (last (cdr lst))))

