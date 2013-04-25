

;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
;; The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.

(define div-by-three-or-five? 
  (lambda (x) 
    (or (div-by? x 3) (div-by? x 5))))

(define div-by?
  (lambda (x n)
    (= (modulo x n) 0)))

(define from-x-to-y
  (lambda (x y)
    (cond
     ((= x y) (list x))
     (else
      (cons x (from-x-to-y (add1 x) y))))))

(div-by-three-or-five? 15)

(foldl + 0 (filter div-by-three-or-five?
             (from-x-to-y 1 999)))
