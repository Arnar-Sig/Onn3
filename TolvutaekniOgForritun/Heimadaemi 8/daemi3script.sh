#!/bin/bash

./slembi > gildi.txt

max=400
for (( i=0; i<=max; i++))
do
./slembi >> gildi.txt
done