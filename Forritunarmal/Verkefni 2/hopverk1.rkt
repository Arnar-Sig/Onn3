(define (last x)
  (if (null? (cdr x))
      (car x)
      (last (cdr x))
      )
  )
(define (remove-last x)
  (if (null? (cdr x))
      '()
      (cons (car x) (remove-last (cdr x)))
      )
  )

;; Notkun: (penultimate x)
;; Fyrir: x=(x1 x1 ... xN-1 xN) er listi
;;        x verður að innihalda a.m.k tvö stök.
;; Gildi: xN-1
(define (penultimate x)
  (if (null? (cddr x))
      (car x)
      (penultimate (cdr x))))

;; Notkun: (remove-penultimate x)
;; Fyrir:  x=(x1 x2 ... xN-1 xN) er listi.
;;         x verður að innihalda a.m.k. tvö stök.
;; Gildi:  Listinn (x1 x2 ... xN-2 xN), þar sem
;;         búið er að fjarlægja xN-1.(define (remove-penultimate x)...)
(define (remove-penultimate x)
  (if(null?(cddr x))
     (cdr x)
     (cons (car x) (remove-penultimate(cdr x)))))
               
;; Notkun: (myproduct s x)
;; Fyrir:  x=(x1 x2 ... xN) er listi talna.
;; Gildi:  Margfeldi talnanna s, x1, x2, ..., xN.
(define (myproduct s x)
  (if(null? x)
     s
     (if(null? (cdr x))
        (cons (*(car x) s) '())
        (cons (*(car x) s) (myproduct s (cdr x))))))
 
;; Notkun: (myappend x y)
;; Fyrir:  x=(x1 x2 ... xN) er listi.
;;         y=(y1 y2 ... yM) er listi.
;; Gildi:  Listinn (x1 x2 ... xN y1 y2 ... yM).
(define (myappend x y)
  (if(null? x)
     y
     (myappend (remove-last x) (cons (last x) y))))
