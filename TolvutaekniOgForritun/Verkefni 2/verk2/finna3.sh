#!/usr/bin/bash

./csim -s 1 -E 1 -b 15 -t traces/gauss.trace > gildi.txt


for (( s = 1; s < 15; s++))
do
    for ((E = 1; E < 8192; E++))
    do
        for ((b = 1; b < 14; b++))
        do
            if (( 2**$s * E * 2**$b == 32768 ));
            then
                ./csim -s $s -E $E -b $b -t traces/ps.trace >> gildi.txt
            fi
        done
    done
done
