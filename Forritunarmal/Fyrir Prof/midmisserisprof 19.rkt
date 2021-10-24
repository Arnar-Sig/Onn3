;5
(define (square x)
  (define (hjalp s x)
    (if (null? x)
        s
        (hjalp (+ s (* (car x) (car x))) (cdr x))))
  (hjalp 0 x))

;6

(define (zipMapRev x y)
  (if(null? x)
     '()
     (cons (zipMapRev (cdr x) (cdr y)) ((car x) (car y)) ))) 