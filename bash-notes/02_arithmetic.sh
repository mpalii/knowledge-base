#!/bin/bash


#Arithmetic example
echo -e "\tArithmetic example:"
arg1=37
arg2=63
sum=$((arg1+arg2))
sub=$((arg1-arg2))
mul=$((arg1*arg2))
div=$((arg2/arg1))
rem=$((arg2%arg1))
echo -e $arg1 + $arg2 = $sum'\n'\
$arg1 - $arg2 = $sub'\n'\
$arg1 \* $arg2 = $mul'\n'\
$arg2 / $arg1 = $div'\n'\
$arg2 % $arg1 = $rem'\n'

