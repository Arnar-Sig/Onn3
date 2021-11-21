; 1
(define (revindex n)
  (define (hjalp n i x)
    (if(= n (- i 1))
       x
       (hjalp n (+ i 1) (cons i x))
    )
  )
  (hjalp n 1 '())
)

; 2
(define (foldr f x u)
  (define (hjalp y s)
    (if(null? y)
       s
       (hjalp (cdr y) (f (car y) s))
    )
  )
  (hjalp (reverse x) u)
)


; 3
(define (daemi3a)
  (foldr * (revindex 20) 1)
)
(define (daemi3b)
  (foldr + (revindex 20) 1)
)

; 4
(define (foldrec f x u)
  (if(null? x)
     u
     (f (car x) (foldrec f (cdr x) u))))


; 5
(define (foldl f u x)
   (if(null? x)
      u
      (foldl f (f u (car x)) (cdr x))))