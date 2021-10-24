;Dæmi 1

;; Notkun: (foldrec f x u)
;; Fyrir:  f er tvíundarfall, þ.e. fall
;;         sem tekur tvö viðföng af einhverju
;;         tagi, x er listi (x1 ... Xn)
;;         gilda af því tagi, u er gildi
;;         af því tagi.
;; Gildi:  (f x1 (f x2 (f ... (f xN u)...)))
;; Aths.:  Með öðrum orðum, ef við skilgreinum
;;         tvíundaraðgerð ! með a!b = (f a b),
;;         þá er útkoman úr fallinu gildið á
;;           x1 ! x2 | ... ! xN ! u
;;         þar sem reiknað er frá hægri til
;;         vinstri
(define (foldrec f x u)
  (if (null? x)
      u
      (f (car x) (foldrec f (cdr x) u))
  )
)


;Dæmi 2

;; Notkun: (foldl f u x)
;; Fyrir:  f er tvíundarfall, þ.e. fall
;;         sem tekur tvö viðföng af einhverju
;;         tagi, x er listi (x1 ... Xn)
;;         gilda af því tagi, u er gildi
;;         af því tagi.
;; Gildi:  (f ...(f (f u x1) x2)... xN)
;; Aths.:  Með öðrum orðum, ef við skilgreinum
;;         tvíundaraðgerð ! með a!b = (f a b),
;;         þá er útkoman úr fallinu gildið á
;;           u ! x1 ! x2 | ... ! xN
;;         þar sem reiknað er frá vinstri til
;;         hægri
(define (foldl f u x)
  (if(null? x)
     u
     (foldl f (f u (car x)) (cdr x))
  )
)
