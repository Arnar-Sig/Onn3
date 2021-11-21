(define (zip2 f x y)
  (if(null? x)
     '()
     (cons (f (car x) (car y)) (zip2 f (cdr x) (cdr y)))))


(define (fall x a b)
  (define (hjalp x g a b)
    (if(null? x)
       '()
       (if(> (car x) a)
          (if(< (car x) b)
             (cons (car x) (hjalp (cdr x) g a b))
             (hjalp (cdr x) g a b))
          (hjalp (cdr x) g a b)
       )
    )
  )
  (hjalp x x a b)
)


(define (fall2 x a b)
    (if(null? x)
       '()
       (if(> (car x) a)
          (if(< (car x) b)
             (cons (car x) (fall2 (cdr x) a b))
             (fall2 (cdr x) a b))
          (fall2 (cdr x) a b)
       )
    )
  )





(define (sumFromTo i j f)
  (if (or (> i j) (and (= i 0) (= j 0)))
      0
      (sumFromTo (+ (f i) 1) j)))


(define (iota n )
  (define (hjalp i x)
    (if(= i n)
       x
       (hjalp (+ i 1) (cons i x))))
  (hjalp 0 '()))