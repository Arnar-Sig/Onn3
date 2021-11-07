import Prelude

-- Notkun: listAll i n f
-- Fyrir:  i og n eru gildi með i<=n+1 og f er fall
-- Eftir:  listinn [f(i),f(i+1),...,f(n)]
listAll i n f =
    hjalp i n f []
    where
        -- Notkun: hjalp i n f s
        -- Fyrir:  i og n eru gildi með i<=n+1, f er fall og s er listi
        --         af gildum sem hafa nú þegar verið afgreidd
        -- Eftir:  listinn [f(i),f(i+1),...,f(n)]
        hjalp i n f s =
            if n+1 == i then
                return s
            else
                hjalp i (n-1) f (f(n):s)

-- Notkun: powerList x
-- Fyrir:  x er listi
-- Eftir:  Listi allra undirlista x, þ.e. listi þeirra lista sem fá má með
--         því að fjarlægja núll eða fleiri gildi úr x og skilja hin eftir
--         í óbreyttri röð.
powerList x =
    if x == [] then
        [[]]
    else
        (powerList (tail x)) ++ (map (\z -> (head x):z) (powerList (tail x)))