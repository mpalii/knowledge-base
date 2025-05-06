#/bin/bash

index=0

while [ $index -lt 100 ]
do
	echo $index
	index=$(($index+1))
	sleep 1s
done
