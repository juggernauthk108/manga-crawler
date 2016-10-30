#!/bin/bash

for x in `seq 1 850`;
do

mkdir ep$x #make directory for a new episode
cd ep$x

y=1 

wget http://www2.watchop.io/manga2/read/one-piece/$x/$y -q -O pagesource

limit=$(grep of... pagesource -o | awk '{print $2}') #extract the number of scenes in the episode

echo this episode has : $limit

for y in `seq 1 $limit`;
do

echo waiting on $x and $y

wget http://www2.watchop.io/manga2/read/one-piece/$x/$y -q -O pagesource #get the source code of the page of episode $x and scene $y 

wait

wget `grep src.*mangareader.net/one-piece/.*/one-piece-.*.jpg pagesource -o | sed 's/^\(src="\)*//'` -q -O ep$x\_scene$y.jpg
#extract and download the image
echo 
echo 

done 

rm pagesource
cd ..

done
