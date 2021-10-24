;; Notkun: (sum x)
;; Fyrir:  x=(x1 x2 ... xN) er listi talna.
;;         x má vera tómur.
;; Gildi:  Summa talnanna, þ.e. x1+x2+...+xN.

(define (sum x)
  (if(null? x)
     0
     (+ (car x) (sum(cdr x)))))



;; Notkun: (squaresum x s)
;; Fyrir:  x=(x1 x2 ... xN) er listi talna.
;;         x má vera tómur.
;;         s er tala.
;; Gildi:  Summan s+x1^2+x2^2+...+xN^2.

(define (squaresum x s)
  (if(null? x)
     s
     (if(null? (cdr x))
        (+(* (car x) (car x))s)
        (+(* (car x) (car x)) (squaresum (cdr x) s))
     )
  )
)

;; Notkun: ((incall y) x)
;; Fyrir:  y er tala, x=(x1 x2 ... xN) er listi talna.
;; Gildi:  Talnalistinn (y+x1 y+x2 ... y+xN).

(define (incall y)
  (lambda (x)
    (if(null? (cdr x))
       (cons (+(car x) y) '())
       (cons(+(car x) y) ((incall y)(cdr x))))))
