; 1
(lambda (x)
  (lambda (y)
    (/ (+ x y) y)))
; 2
(((lambda (x)
   (lambda (y)
     (/ (+ x y) y)
   )
  )3
 )6
)

; 3
(((lambda (x)
  (lambda (y)
    (x (x y))
  )
  )
  (lambda (x)
   (* x x)
  )
 )3
)

; 4
(lambda (x)
  (/(+ x z) z)
)

; 5
(lambda (x)
  (lambda (y)
    (lambda (z)
      (x (y (y z))))))