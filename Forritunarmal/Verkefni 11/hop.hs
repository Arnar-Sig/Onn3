import Data.List

-- Notkun: listilisti x
-- Fyrir:  x er listi [x1,x2,...,xN]
-- Eftir:  listinn [[xN],...,[x2],[x1]]
listilisti x =
    foldl (\a b-> [b]:a) [] x

-- Notkun: summa x
-- Fyrir:  x er listi af listum fleytitalna [[a1,...,aN],...,[z1,zM]]
-- Eftir:  summa margfeldi innri lista eða a1*...*aN + ... + z1*...*zM
summa x =
   hjalp 0 x
   where
       -- Notkun: hjalp i s
       -- Fyrir:  i er summa af þeim innri listum sem hafa nú þegar verið afgreiddir
       --         s er listi af listum fleytitalna [[a1,...,aN],...,[z1,zM]]
       -- Eftir:  i + margfeldið af innri lista y=[y1,y2,...,yB]sem er hausinn
       --         af ytri listanum s eða i + y1*y2*,...,*yB
       hjalp i s = do
           if s== [[]] || s==[] || null (head s) then
               return i
            else
                hjalp (i+(foldl (*) 1 (head s))) (tail s)












summaTest x =
   hjalp 0 x
   where
       hjalp i s = do
           if s== [[]] || s==[] || null (head s) then
               return i
            else
                hjalp (i+(foldl (*) 1 (head s))) (tail s)