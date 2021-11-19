#!/bin/bash

./variation > gildi.txt

max=400
for (( i=0; i<=max; i++))
do
./variation >> gildi.txt
done