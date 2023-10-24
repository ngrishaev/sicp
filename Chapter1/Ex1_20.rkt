;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex1_20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b)))
  )

;(remainder 206 40) = 6
;(remainder 40 6) = 4
;(remainder 6 4) = 2
; (gcd 206 40) - applicative
;===
;(gcd 206 40)
;--
;(if (= 40 0)
;    206
;    (gcd 40 (remainder 206 40))) ; 1 call
;
;(gcd 40 6)
;--
;(if (= 6 0)
;    40
;    (gcd 6 (remainder 40 6))) ; 2 calls
;
;(gcd 6 4)
;--
;(if (= 4 0)
;    6
;    (gcd 4 (remainder 6 4))) ; 3 calls
;
;(gcd 4 2)
;--
;  (if (= 2 0)
;      4
;      (gcd 2 (remainder 4 2))) ; 4 calls
;
;  (gcd 2 0)
; --
; (if (= 0 0)
;     2
;     (gcd 0 (remainder 2 0)))
;
; 2
;; 4 total remainder calls
;
;;========+++++++++++===========+++++++++++++
;(remainder 206 40) = 6 ; 1 call
;(remainder 40 (remainder 206 40)) = 4 ; 2 calls
;(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) = 2 ; 4 calls
;(remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) = 0 ; 7 calls
;; (gcd 206 40) - normal
;===
;(gcd 206 40)
;--
;(if (= 40 0) ; 40!=0 -> #f
;    206
;    (gcd 40 (remainder 206 40)))
;
;(gcd 40 (remainder 206 40))
;--
;(if (= (remainder 206 40) 0) ; 1 call || 6!=0 -> #f
;    40
;    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;--
;(if (= (remainder 40 (remainder 206 40)) 0) ; 1 + 2 calls || 4!=0 -> #f
;    (remainder 206 40)
;    (gcd (remainder 40 (remainder 206 40))
;         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
;(gcd (remainder 40 (remainder 206 40))
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;--
;(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 1 + 2 + 4 calls || 2!=0 -> #f
;    (remainder 40 (remainder 206 40))
;    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;
;
;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;--
;(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ; 1+2+4+7 calls || 0==0 -> #t
;    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;
;(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ;1+2+4+7+4 calls
;2 ; total 18 calls to remainder func