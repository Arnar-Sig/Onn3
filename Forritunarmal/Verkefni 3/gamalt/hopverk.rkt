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
      (/(+ a b)b)))3)6)


;Dæmi 3
(((lambda (x)
    (lambda (y)
     (+ x y))
      )5)(lambda (x)
          (* x x)5))

