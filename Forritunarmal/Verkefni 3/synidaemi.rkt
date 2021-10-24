(((lambda (y)
    (lambda (z)
      (* z y))
  )6
 )10
)


;af stackoverflow
(((lambda (x)
    (lambda (y)
      (display y)
      (newline)
      (x (x y)
      )
    )
  )
  (lambda (x)
    (+ x x)
  )
 )3
)