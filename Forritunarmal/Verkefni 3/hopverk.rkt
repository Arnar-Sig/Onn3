;Dæmi 1
(lambda (x)
   (lambda (y)
     (/(+ x y)y)))
;Segðin skilar tölu sem er útkoman úr (x+y)/y, þar sem x og y eru tölur sem eru í inntaki falls.
;Hvorug breytan í segðinni er frjáls þar sem þær eru bundnar inntakinu í lambda (x) og lambda (y).
;Endurskrifuð með öðrum breytunöfnum:
(lambda (a)
  (lambda (b)
    (/(+ a b)b)))


;Dæmi 2
(((lambda (x)
   (lambda (y)
     (/(+ x y)y)))3)6)
;Segðin skilar tölu sem er útkoman úr (x+y)/y, þar sem x og y eru tölur sem eru í inntaki falls.
;Í þessu tilfelli skilar fallið 1.5 þar sem kallað er á lambda(x) með 3 og lambda(y) með 6.
;Hvorug breytan í segðinni er frjáls þar sem þær eru bundnar inntakinu í lambda (x) og lambda (y).
;Endurskrifuð með öðrum breytunöfnum:
(((lambda (a)
    (lambda (b)
      (/(+ a b)b)
    )
  )3
 )6
)


;Dæmi 3
(((lambda (x)
    (lambda (y)
     (x(x y))
    )
  )
  (lambda (x)
    (* x x)
  )
 )3
)
;Segðin skilar tölu þar sem útkoman er x(x*(x*x)) þar sem x er inntakið. Í þessu tilfelli er það 3(3*(3*3))=81
;Engin breyta er frjáls því þær eru allar bundnar inntaki í lambda(x), lambda(y), og lambda(x)
;Endurskrifuð með öðrum breytunöfnum:
(((lambda (a)
    (lambda (b)
     (a(a b))
    )
  )
  (lambda (c)
    (* c c)
  )
 )3
) 