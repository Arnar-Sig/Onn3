;Dæmi 1
(lambda (x)
  (/ (+ x z) z))
;Segðin skilar tölu sem er útkoman úr (x+z)/z þar sem x er fegin úr inntaki fallsins.
;Breytan x er ekki frjáls því hún er bundin inntakinu í lambda(x) en z er frjáls því hún er ekki bundin.
;Hægt væri til að mynda að breyta z í b eða i án þess að neitt breytist.
;Endurskrifuð með öðrum breytunöfnum:
(lambda (a)
  (/ (+a b) b))

;Dæmi 2
((lambda (x)
  (lambda (y)
    (lambda(z)
      (x(y(y z)))))7)5)