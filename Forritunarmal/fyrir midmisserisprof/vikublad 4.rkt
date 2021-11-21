;1
(define (revindex n)
    (if(= n 0)
       '()
       (cons n (revindex (- n 1)))))

;2
(define (foldr f x u)
  (define (hjalp f x u g)
    (if(null? x)
       (f u g)
       (hjalp f (cdr x) u (f (car x) g))))
  (hjalp f x u 0))


;3
(define (foldrec f x u)
  (if(null? x)
     u
     (f (car x) (foldrec f (cdr x) u))))

;4
(define (foldl f u x)
  (if(null? x)
     u
     (foldl f (f u (car x)) (cdr x))))



