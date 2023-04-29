#!/bin/bash


#IF-ELSE example
read -p "Enter the value:" input

if [ "$input" == 5 ]; then
	echo FIVE
elif [ "$input" == "four" ]; then
	echo FOUR
else 
	echo DEFAULT_OUTPUT
fi
