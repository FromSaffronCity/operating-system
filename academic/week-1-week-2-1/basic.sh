#!/bin/bash

echo -e "\n-------------------------------------\n"

# USER is a variable for username
# PATH is an environment variable in LINUX telling the shell which directory to search for executable file in response to commaned issued by user

echo -e "$USER\n"  #NOTICE: "-e" for enable \n and "\n" for newline
echo "$PATH"

echo -e "\n-------------------------------------"

# print nothing as variables are case sensitive, user & USER are different variables, and user is not assigned a value (same for path)

echo $user  
echo $path

echo -e "-------------------------------------\n"

# variables

var=5  # this is also taken as string 
str="hello world"  #NOTICE: no space

echo $var
echo number is: $var  #NOTICE
echo number is: \$var  #NOTICE
echo '$str visitor!'
echo "$str visitor!"

echo -e "\n-------------------------------------\n"

# input using read

echo "input den: "
read var
echo -n "arekbar den: "  #NOTICE
read str

echo -e "\n$var"
echo $str

echo -e "\n-------------------------------------\n"

# shell arithmetic

expr 47 + 23  #NOTICE: space must be there
expr 47 - 23
# expr 47 * 23 - this does not work
expr 47 \* 23  #NOTICE: this is multiplication
expr 47 / 23
expr 47 % 23

var=`expr 52 + 71`  #NOTICE: use `` not ''
var2=15
var2=`expr $var2 + 23`

echo -e "\n$var"
echo $var2

var2=$var

echo -e "\n$var2"

echo -e "\n-------------------------------------\n"

var=23
var2=47
zero=0

expr $var + $var2
expr $var = $var2
expr $var != $var2

expr $var \| $var2  #NOTICE: below
expr $var \| $zero
expr $zero \| $var2
expr $zero \| $zero
expr $var \& $var2
expr $var \& $zero
expr $zero \& $var2
expr $zero \& $zero

echo ""  #NOTICE: newline

expr $var \>= $var2
expr $var \> $var2
expr $var \< $var2
expr $var \<= $var2

echo -e "\n-------------------------------------\n"

