#!/bin/bash

echo -e "\n-------------------------------------\n"

# iterative-fibonacci-number

echo -n "input a number: "
read number

fib[0]=0
fib[1]=1

for((i=2; i<=number; i++)); do
	fib[$i]=`expr ${fib[$i-1]} + ${fib[$i-2]}`  ## or, fib[$i]=$((${fib[$i-1]}+${fib[$i-2]}))
done

echo "answer: ${fib[$number]}"

echo -e "\n-------------------------------------\n"

# recursive-fibonacci-number

function fibonacci() {
	if [ "$1" = "0" -o "$1" = "1" ]; then  ## -o for OR, -a for AND
		echo "$1"
	else
		var=`expr "$(fibonacci $(($1-1)))" + "$(fibonacci $(($1-2)))"`  ## NOTICE: whole-expression
		echo "$var"
	fi
}

echo -n "input a number: "
read number
result="$(fibonacci $number)"
echo "$number-th fibonacci number: $result"

echo -e "\n-------------------------------------\n"

