; 1
(define (atoi n)
  (define (hjalp x n i)
    (if(= n i)
       (cons n x)
       (hjalp (cons i x) n (+ i 1))
    )
  )
  (hjalp '() n 1)
)

; 2
(define (foldr f x u )
  (if(null? x)
     u
     (+ (car x) (foldr f (cdr x) u))))