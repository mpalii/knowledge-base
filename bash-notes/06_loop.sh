#!/bin/bash


# FOR loop example
for (( i=0; i<10; i++)); do
	echo for $i
done


#Alternative FOR loop example
for i in {0..10}; do
	echo for in $i
done


#WHILE loop example
i=0
while [ $i -lt 10 ]; do
	echo while $i
	i=$(($i+1))
done
