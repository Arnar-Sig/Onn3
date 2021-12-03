(define (foldr f x u)
  (if(null? x)
     u
     (f (car x) (foldr f (cdr x) u))))

(define (foldl f x u)
  (if(null? x)
     u
     (foldl f (cdr x) (f (car x) u))))

(define (powerlist x)
  (if(null? x)
     '(())
     (append (powerlist (cdr x)) (map (lambda(z)(cons (car x) z)) (powerlist (cdr x))))
  )
)

(define (powerlistn n)
  (define (hjalp i)
    (if(> i n)
       '(())
       (append (hjalp (+ i 1)) (map (lambda(z)(cons i z)) (hjalp (+ i 1))))
    )
  )
  (hjalp 1)
)

(define (powerlistnVaxandi n)
  (define (hjalp i)
    (if(> i n)
       '(())
       (append (map (lambda(z)(cons i z)) (hjalp (+ i 1))) (hjalp (+ i 1)))
    )
  )
  (hjalp 1)
)


(define (zip2 f x y)
  (define (hjalp f x y z)
    (if(null? x)
       z
       (hjalp f (cdr x) (cdr y) (cons (f (car x) (car y)) z))
    )
  )
  (hjalp f x y '())
)


(define (atoi n)
  (define (hjalp i x)
    (if(> i n)
       x
       (hjalp (+ i 1) (cons i x))
    )
  )
  (hjalp 1 '())
)

(define (iota n)
  (define (hjalp i x)
    (if(< i 1)
       x
       (hjalp (- i 1) (cons i x))
    )
  )
  (hjalp n '())
)


(define (annadVeldi x)
  (define (hjalp z y)
    (if(null? z)
       y
       (hjalp (cdr z) (+ (* (car z) (car z)) y))
    )
  )
  (hjalp x 0)
)


;; Notkun (minmax x)
;; Fyrir: x er listi af listum af fleytitölum milli 0 og 1
;;        x = ((x11 x12 x1N) (x21, x22... x2N)...(xM1... xMN))
;; Gildi: Minnsta hágildi innri listanna. Lægsta gildi tóma mengisins er 1
(define (minmax x)
  ;; Notkun (maxOfList z)
  ;; Fyrir: z er listi af fleytitölum milli 0 og 1.
  ;;        z = (z1 ... zN)
  ;; Eftir: Hágildi talnanna í listanum. Stærsta gildi tóma mengisins er 0.
  (define (maxOfList z)
    (if (null? z)
        0
        (max (car z) (maxOfList (cdr z)))
        )
    )
  (if (null? (cdr x))
      (maxOfList (car x))
      (min (maxOfList (car x)) (minmax (cdr x)))
  )
)


(define (mappari f)
  (define (g x)
    (define (hjalp y z)
      (if(null? y)
         (reverse z)
         (hjalp (cdr y) (cons (f (car y)) z))
      )
    )
    (hjalp x '())
  )(g '(1 2 3))
)

(define (powerlist n)
  (define (hjalp i)
    (if(> i n)
       '(())
       (append (hjalp (+ i 1)) (map (lambda(z) (cons i z)) (hjalp (+ i 1))))
    )
  )
  (hjalp 1)
)


(define (summaMarg x)
  (define (hjalp z u)
    (if(null? z)
       u
       (hjalp (cdr z) (+ (foldl * (car z) 1) u))
    )
  )
  (hjalp x 0)
)

