#!/bin/bash


#String variable example
echo -e "\t1. String variable:"
string_var="String variable content (just simple text)"
echo -e '$string_var'=$string_var'\n'


#Integer variable example
echo -e "\t2. Iinteger variable:"
integer_var=1024
echo -e '$integer_var'=$integer_var"\n"


#Command result example
echo -e "\t3. Store 'pwd' command output to a variable:"
dir=`pwd`
echo -e Current folder is: $dir'\n'


#Commant result (alternative synthax) example
echo -e "\t4. Store 'date' command output to a variable (alternatyve syntax):"
now=$(date)
echo -e Current date is: $now'\n'


#System type example
echo -e "\t5. System type and description:"
os_info=`uname -a`
echo -e System info: $os_info'\n'

