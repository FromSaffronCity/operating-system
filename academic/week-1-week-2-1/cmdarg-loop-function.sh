#!/bin/bash

echo -e "\n-------------------------------------\n"

# command line arguments (bash cmdarg-loop-function.sh arg1 arg2 arg3 ...)

echo "number of arguments passed: $#"
echo "arguments are: $*"
echo "among them, 1st argument is: $1"  # if there is no argument $n, then empty string (null) is shown

echo -e "\n-------------------------------------\n"

# for loop

echo "number of arguments passed: $#"
counter=1

for arg in $*
do
	echo "$counter-th argument is $arg"
	counter=`expr $counter + 1`  #NOTICE: use of `expr `
done

echo -e "\ncurrent directory has:-"

for name in `ls`  #NOTICE: use of `shell command`/`ls`
do
	echo $name
done

echo -e -n "\ncounting from 1 to 10: "

for((i=1;i<=10;i++))  
do
	echo -n "$i "  #NOTICE: this loop statement
done

echo -e "\n\n-------------------------------------\n"

# while and until loops

password="123"

echo -n "enter password: "
read pass

while [ $password != $pass ]
do
	echo -n "wrong password, try again: "
	read pass
done

echo -e "right password entered\n"

target=0
counter=10

until [ $target -eq $counter ]
do
	echo -n "$counter "
	counter=`expr $counter - 1`
done

echo -e "\ncount down complete"

echo -e "\n-------------------------------------\n"

# functions

function show_argument() {
	echo -n -e "total arguments: $#\narguments are: "

	for arg in $*
	do
		echo -n "$arg "
	done
}

function funct() {
	echo "inside funct()"
	show_argument $*
}

echo -e "arguments from command line:-\n"
show_argument $*

echo -e "\n\narguments passed to funct from script:-\n"
funct 1 3 5 7 9

echo -e "\n\narguments from command line:-\n"
show_argument $*

function factorial() {
	factor=1

	for((i=1;i<=$1;i++)) 
	do
		factor=`expr $factor \* $i`
	done

	echo $factor
}
var="$(factorial 6)"
echo -e "\n\n6! = $var\n"

function boo() {
	str="boo boo boo"
}
boo
echo $str  #NOTICE: str can be referred to from outside the function after function call

function foo() {
	echo "foo foo foo"
}
echo "$(foo)"

function yes_or_no() {
	echo -e -n "\nyes or no: "
	read input

	case $input in
		yes|y|Yes|Y) return 0;;  #NOTICE: we can return only numeric value. for others, use echo.
		no|n|No|N) return 1;;
		*) return 1;;
	esac
}

function yes_no() {
	case $* in
		yes|y|Yes|Y) return 0;;  #NOTICE: we can return only numeric value. for others, use echo.
		no|n|No|N) return 1;;
		*) return 1;;
	esac
}

if yes_or_no; then  #NOTICE: 0 = true, 1 = false
	echo -e "\nYES"
else
	echo -e "\nNO"
fi

if yes_no $*; then  #NOTICE: 0 = true, 1 = false
	echo -e "\nYES"
else
	echo -e "\nNO"
fi

echo -e "\n-------------------------------------\n"

