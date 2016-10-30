#!/bin/bash

for x in `seq 1 850`;
do

mkdir ep$x
cd ep$x

for y in `seq 1 80`;
do

echo waiting on $x and $y

wget http://www2.watchop.io/manga2/read/one-piece/$x/$y -q -O pagesource 

wait

#wait `ps -aux | grep wget\ http://www2.watchop.io/manga2/read/one-piece/$x/$y | awk '{print $2}' | head -n 1`

wget `grep src.*mangareader.net/one-piece/.*/one-piece-.*.jpg pagesource -o | sed 's/^\(src="\)*//'` -q -O ep$x\_scene$y.jpg
 

echo 
echo 

done 

rm pagesource
cd ..

done

