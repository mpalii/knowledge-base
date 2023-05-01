#!/bin/bash


#User input example
echo -e "\tUser input example:"
read -p "Please enter some text value..." input
echo -e Your input is : \'$input\'
echo -e Number of characters is: ${#input}"\n"
