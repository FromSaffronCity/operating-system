#!/bin/bash

echo -e "\n-------------------------------------\n"

# command-line-arguments

echo "\$0 is name of the script: $0"
echo "total args: $#"
echo "args: $*"
echo "1-st arg is \$1: $1"

echo -e "\n-------------------------------------\n"

# command-line-arguments-continued

for arg in $*; do
	echo "$arg"
done
echo ""  ## NOTICE: newline

for arg in $@; do
	echo "$arg"
done
echo ""  ## NOTICE: newline

for arg in "$*"; do
	echo "$arg"
done
echo ""  ## NOTICE: newline

for arg in "$@"; do
	echo "$arg"
done

echo -e "\n-------------------------------------\n"

# expression-advanced

var1=`expr 3 + 3`
var2=$((3+3))

echo "$var1"
echo "$var2"

echo -e "\n-------------------------------------\n"

# array

array[0]=1
array[1]=2
array[2]=3
array[3]=4

index=2

echo -e "array size: ${#array[*]}\n"

echo -n "array: "
echo -n "${array[0]} "
echo -n "${array[1]} "
echo -n "${array[$index]} "
echo "${array[3]}"

echo -e "\n-------------------------------------\n"

# array-continued

array=("apple" "banana" "carrot" "doughnut" "egg" "fries" "garlic")

for item in ${array[*]}; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in ${array[@]}; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in "${array[*]}"; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in "${array[@]}"; do
	echo "$item"
done

echo -e "\n-------------------------------------\n"

# array-continued-2

array=(a b c d e f g h)

for item in ${array[*]}; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in ${array[@]}; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in "${array[*]}"; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in "${array[@]}"; do
	echo "$item"
done

echo -e "\n-------------------------------------\n"

# array-continued-3

array=(a "b c" d e "f g" h)

for item in ${array[*]}; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in ${array[@]}; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in "${array[*]}"; do
	echo "$item"
done
echo ""  ## NOTICE: newline

for item in "${array[@]}"; do
	echo "$item"
done

echo -e "\n-------------------------------------\n"

