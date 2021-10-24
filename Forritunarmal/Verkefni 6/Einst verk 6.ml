(*
** Notkun: lengd x
** Fyrir: x er listi af 0 eða fleiri gildum
** Gildi: lengd á listanum x
*)
let lengd x = list_it(function x -> function y -> y + 1) x 0
;;

lengd [1;2;3];;





(*
** Notkun: powerList x
** Fyrir: x er listi af 0 eða fleiri gildum
** Gildi: listi af listum sem inniheldur alla mögulega lista sem
**        eru undirlistar x í þeim skilningi að undirlistarnir 
**        innihalda gildi úr listanum x í sömu röð og í x, nema hvað 
**        fjarlægja má núll eða fleiri gildi úr listanum x.
*)
let rec powerList x =
	if x= [] then
		[[]]
	else
		powerList (tl x) @ (map (fun y -> (hd x)::y) (powerList (tl x)))
;;

powerList [1;2];;



