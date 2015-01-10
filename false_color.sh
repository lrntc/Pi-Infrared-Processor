#!/bin/bash          

echo Initialising.

n=1

numfiles =  ls | wc -l

while [ $n -le 5 ]; do

echo ----------   Processing picture no. $n   ----------

echo $n - Auto Level
convert $n.jpg -auto-level fc_$n.jpg

echo $n - Black Point Compensation
convert fc_$n.jpg  -black-point-compensation fc_$n.jpg

echo $n - Recolor
convert fc_$n.jpg  -color-matrix ' 0.0 0.0 0.450
                                0.0 0.360 0.0
                                0.450 0.0 0.0  '   fc_$n.jpg
echo ----------   Finished picture no. $n   ----------
echo   

n=$(( $n + 1 ))

done;


