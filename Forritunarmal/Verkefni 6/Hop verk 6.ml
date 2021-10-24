# liklega vitlaust ( skilar 0)
let rec mapreduce f op u x=
    if x=[] then
        u
    else
        mapreduce f op (op u (hd x)) (tl x)
;;

let inc x = x+1 
and mul x y = x*y in mapreduce inc mul 1 [0;1;2;3;4];;



#liklega rett? (skilar 120)

(*
** Notkun: mapreduce f op u x
** Fyrir: fall f
**        tvíundaraðgerð op
**        gildi u af tagi A
**        listi af gildum af tagi A
** Gildi: gildið u ⊕ f(x1) ⊕ f(x2) ⊕ ... ⊕ f(xn)
**        þar sem x ⊕ y = (op x y)
*)
let rec mapreduce f op u x=
    if x=[] then
        u
    else
        mapreduce f op (op u (f(hd x))) (tl x)
;;

let inc x = x+1 
and mul x y = x*y in mapreduce inc mul 1 [0;1;2;3;4];;




(*
** Notkun: mapftwice f
** Fyrir: fall f
** Gildi: fall g sem tekur lista x sem viðfang og skilar 
**        lista þeirra gilda sem út koma þegar viðfanginu
**        í fallið mapftwice er beitt tvisvar í röð á hvert 
**        stak í listanum x.     
*)
let mapftwice f = 
	let rec hjalp x =
		if x=[] then
			[]
		else
			(f(f (hd x)))::(hjalp (tl x))
	in hjalp
;;

let inc x = x+1 in let f = mapftwice inc in f [1;2;3]
;;
