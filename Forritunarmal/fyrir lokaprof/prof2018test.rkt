;6

(define (fleyti x)
  (define (hjalp x y s m)
    (if(null? x)
       s
       (if(null? y)
          (if(null? (cdr x))
             s
             (if(> m s)
                (hjalp (cdr x) (car(cdr x)) m 1)
                (hjalp (cdr x) (car(cdr x)) s 1)))
       (if(< (car y) m)
          (hjalp x (cdr y) s (car y))
          (hjalp x (cdr y) s m)
       )
       )
     )
  )(hjalp x (car x) 0 1)
)























(define (fleyti2 x)
  (define (hjalp z y max min)
    (if(null? z)
       max
       (if(null? y)
          (if(null? (cdr z))
             max
             (if(> min max)
                (hjalp (cdr z) (car(cdr z)) min 10)
                (hjalp (cdr z) (car(cdr z)) max 10)
             )
          )
          (if(< (car y) min)
             (hjalp z (cdr y) max (car y))
             (hjalp z (cdr y) max min)
          )
       )              
    )
  )
  (hjalp x (car x) 0 10)
)



; 7


(define (zip2 f x y)
  (define (reverze x)
    (define (hjalp x y)
      (if(null? x)
         y
         (hjalp (cdr x)(cons (car x) y))
         )
    )(hjalp x '())
  )
  (define (hjalp f x y s)
    (if(null? x)
       s
       (hjalp f (cdr x) (cdr y) (cons (f (car x) (car y)) s))
    )
  )
  (hjalp f (reverze x) (reverze y) '())
)



; 9

(define (inbetween x a b)
  (define (hjalp x a b s)
    (if(null? x)
       (reverse s)
       (if(and (<= (car x) b) (>= (car x ) a))
          (hjalp (cdr x) a b (cons (car x) s))
          (hjalp (cdr x) a b s)
       )
    )
  )(hjalp x a b '())
)


