#!/bin/bash          

echo Initialising.

n=1

filelist=`ls | grep '.jpg'`

for image_file in $filelist
do

echo ----------   Processing picture no. $n   ----------

#echo $n - Auto Level
#convert $n.jpg -auto-level fc_$n.jpg

#echo $n - Black Point Compensation
#convert fc_$n.jpg  -black-point-compensation fc_$n.jpg

echo $n - Recolor
convert frame_$n.jpg  -color-matrix ' 0 0 1
                                0 1 0
                                1 0 0 '   fc_$n.jpg

echo $n - Auto Tone
./autotone -p -w fc_$n.jpg fc_$n.jpg 

#echo $n - Contrast
#convert fc_$n.jpg -contrast -contrast -contrast -contrast -contrast -contrast


#echo $n - Auto Gamma
#convert fc_$n.jpg -auto-gamma

echo ----------   Finished picture no. $n   ----------

echo   

n=$(( $n + 1 ))

done


