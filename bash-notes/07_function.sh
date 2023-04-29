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

