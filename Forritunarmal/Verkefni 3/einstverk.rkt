;Dæmi 1
(lambda (x)
  (/ (+ x z) z))
;Segðin skilar tölu sem er útkoman úr (x+z)/z þar sem x er fegin úr inntaki fallsins.
;Breytan x er ekki frjáls því hún er bundin inntakinu í lambda(x) en z er frjáls því hún er ekki bundin.
;Hægt væri til að mynda að breyta z í b eða a án þess að neitt breytist.
;Endurskrifuð með öðrum breytunöfnum:
(lambda (a)
  (/ (+a b) b))


;Dæmi 2
(lambda (x)
  (lambda (y)
    (lambda (z)
      (x(y(y z))))))

;Segðin skilar falli þar sem búið er að setja saman föllin y og z og svo er kallað á þau tvö með x.
;Engin breyta í segðini er frjáls því þær eru allar bundnar, x er bundin lambda(x), y lambda(y) og z lambda(z).
;Endurskrifuð með öðrum breytunöfnum:
(lambda (a)
  (lambda (b)
    (lambda (c)
      (a(b(b c))))))

;Dæmi þar sem lambda föll eru sett inn í inntak y og x og þar sem talan sem er sett í upprunalega fallið er 5.
;Þá fer fallið innst í lambda segðirnar og byrjar að setja 5 við y sem er 5*5 = 25, svo er aftur y svo það verður
;25*25 = 625, svo er x tekið með inntakinu 625 og x í þessu tilfelli er 625+625 svo útkoman úr allri segðinni er 1250.
;Í eftirfarandi dæmi eru allar breytur bundnar við lambda segðir.
((((lambda (x)
     (lambda (y)
       (lambda(z)
         
         (x(y(y z)))
       )
     )
   )
   (lambda (b)
      (+ b b)
   )
  )
  (lambda (a)
     (* a a)
  )
 )5
) 