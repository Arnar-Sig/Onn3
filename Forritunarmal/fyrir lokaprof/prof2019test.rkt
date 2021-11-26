(define (summa x)
  (define (hjalp s x)
    (if(null? x)
       s
       (hjalp (+ (* (car x) (car x)) s) (cdr x))
    )
  )
  (hjalp 0 x)
)


(define (zipMapRev x p)
  (define (hjalp x y p)
    (if(null? x)
       y
       (hjalp (cdr x) (cons ((car p) (car x)) y) (cdr p))
    )
  )
  (hjalp x '() p)
)

(define (foldl f x u)
  (if(null? x)
     u
     (foldl f (cdr x) (f (car x) u))))


(define (foldr f x u)
  (if(null? x)
     u
     (f (car x) (foldr f (cdr x) u))))


(define (mapreduce op f x u)
  (if(null? x)
     u
     (op (f (car x)) (mapreduce op f (cdr x) u))
  )
)