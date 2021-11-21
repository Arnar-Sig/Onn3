(define (sum x)
  (if(null? x)
     '()
     (if(null? (cdr x))
        (car x)
        (+ (car x) (sum (cdr x))))))


(define (squaresum x s)
  (if(null? x)
     s
     (squaresum (cdr x) (+ (* (car x) (car x)) s))))

(define (incall y)
  (lambda (x)
    (if(null? x)
       '()
       (cons (+ y (car x)) ((incall y) (cdr x)))))
 
  )