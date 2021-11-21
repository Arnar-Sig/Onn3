(define (penultimate x)
  (if(null? (cddr x))
     (car x)
     (penultimate (cdr x))
  )
)

(define (remove-penultimate x)
  (if(null? (car x))
     '()
     (if(null? (cdddr x))
        (cons (car x) (cddr x))
        (cons (car x) (cdr x)))))

(define (myproduct s x)
  (if(null? x)
     s
     (myproduct (* s (car x)) (cdr x))))


(define (last x)
  (if (null? (cdr x))
      (car x)
      (last (cdr x))))

(define (remove-last x)
  (if(null? (cdr x))
     '()
     (cons (car x)(remove-last(cdr x)))))

(define (myappend x y)
  (if(null? x)
     y
     (myappend (remove-last x) (cons (last x) y))))


(define (sum x)
  (define (hjalp s x)
    (if(null? x)
       s
       (hjalp (+ (car x) s) (cdr x))
    )
  )
  (hjalp 0 x)
)


(define (squaresum x s)
  (if(null? x)
     s
     (squaresum (cdr x) (+(*(car x)(car x)) s))))


(define (incall y)
  (lambda (x)
    (if(null? x)
       '()
       (cons (+ (car x) y)((incall y)(cdr x))))))

