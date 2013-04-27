;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143 ?

(define div-by?
  (lambda (x n)
    (= (modulo x n) 0)))

;; round sqrt to nearest int
(define whole-sqrt
  (lambda (x)
    (floor (sqrt x))))

(define prime?
  (lambda (x)
    (prime-recur x (whole-sqrt x))))

(define prime-recur
  (lambda (x y)
    (cond
     ((= y 1) #t)
     ((div-by? x y) #f)
     (else
      (prime-recur x (sub1 y))))))


(define prime-factorize-helper
  (lambda (x y)
   (cond
    ((< x y) '())
    ((and (div-by? x y) (prime? y)) (cons y (prime-factorize-helper (/ x y) y)))
    (else
     (prime-factorize-helper x (add1 y))))))

(define prime-factorization
  (lambda (x)
    (prime-factorize-helper x 2)))

(car (reverse (prime-factorization 13195)))

