## Bash notes

In order to be able to execute scripts without specifying the bash commnad, just add execution rights to the appropriate bash script file.  

#### Variables
```
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

#Command result (alternative synthax) example
echo -e "\t4. Store 'date' command output to a variable (alternatyve syntax):"
now=$(date)
echo -e Current date is: $now'\n'

#System type example
echo -e "\t5. System type and description:"
os_info=`uname -a`
echo -e System info: $os_info'\n'
```

#### Arithmetic
```
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
```

#### Command line arguments
```
#!/bin/bash

#Command line arguments example
echo -e "\tCommand line arguments example:"
script_name=$0
arg_one=$1
arg_two=$2
echo -e Script name: $script_name'\n'arg1=$arg_one'\n'arg2=$arg_two"\n"
```

#### User input
```
#!/bin/bash

#User input example
echo -e "\tUser input example:"
read -p "Please enter some text value..." input
echo -e Your input is : \'$input\'
echo -e Number of characters is: ${#input}"\n"
```

#### If-Else
```
#!/bin/bash

#If-Else example
read -p "Enter the value:" input

if [ "$input" == 5 ]; then
	echo FIVE
elif [ "$input" == "four" ]; then
	echo FOUR
else 
	echo DEFAULT_OUTPUT
fi
```

#### Loops
```
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
```

#### Functions
```
#! /bin/bash

#FUNCTION example
multiply() {
	res=$(($1*$2))
	echo "Result: $res"
}

multiply 3 4

# FUNCTION alternative synthax example
function print_function {
	echo "Alternative function"
}

print_function
```
