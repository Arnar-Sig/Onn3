;Dæmi 1

;; Notkun: (revindex n)
;; Fyrir: n er heiltala, n>=0
;; Gildi: listi allra heiltalna i, þannig að
;;        0<i<=n, í minnkandi röð.
(define (revindex n)
  ;; Notkun: (hjalp i x)
  ;; Fyrir: n er heiltala, n>=0
  ;;        i er heiltala, i>=0
  ;;        x er listi af heiltölum
  ;; Gildi: listi allra heiltalna i, þannig að
  ;;        0<i<=n, í minnkandi röð.
  (define (hjalp i x)
    (if (> i n)
        x
        (hjalp (+ 1 i)(cons i x))
    )
  )
  (hjalp 1 '()))
        
  
;Dæmi 2

;; Notkun: (foldr f x u)
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
(define (foldr f x u)
  ;; Notkun: (hjalp rev u)
  ;; Fyrir: rev er listi (x1 ... xN) af gildum 
  ;;        af einhverju tagi og u er gildi af sama tagi.
  ;; Gildi: Ef tvíundaraðgerðin ! er skilgreind með
  ;;        a!b = f( a b) þá er útkoman úr fallinu gildið á
  ;;       (f xN (f xN-1 (f ... (f x1 u)...))) eða 
  ;;        u ! x1 ! x2 ! ... ! xN 
  ;;        þar sem reiknað er frá vinstri til hægri.
  (define (hjalp u rev)
    (if (null? rev)
        u
        (hjalp (f (car rev) u) (cdr rev))
  )
 )(hjalp u (reverse x))
)


;Dæmi 3

;; Notkun: (sum n)
;; Fyrir: n er heiltala, n>=0
;; Gildi: gildi x þar sem x= n + n-1 + n-2 + ... + 1 + 0
(define (sum n)
  (foldr + (revindex n) 0)
)

;; Notkun: (sum n)
;; Fyrir: n er heiltala, n>0
;; Gildi: gildi x þar sem x = n * n-1 * n-2 * ... * 1
(define (multi n)
  (foldr * (revindex n) 1)
)