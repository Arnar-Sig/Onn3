(define (foldr f u x)
  (if(null? x)
     u
     (f (car x) (foldr f u (cdr x)))))


(define (atoi n)
  (define (hjalp n i x)
    (if(> i n)
       x
       (hjalp n (+ i 1) (cons i x)))
  )
  (hjalp n 1 '())
)

(define (mapper f)
  (define (g x)
    (define (hjalp g x s)
      (if(null? x)
         s
         (hjalp g (cdr x) (cons (f (car x)) s))
      )
    )
    (hjalp g x '())
  )
  (g '(1 2 3))
)
       