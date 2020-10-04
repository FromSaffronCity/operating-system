#!/bin/bash

echo -e "\n-------------------------------------\n"

# if-else statement (string comparison)

str1="sahil"
str2="mahir"

if [ $str1 = $str2 ]; then
	echo -e "both strings are same\n"
elif [ $str1 != $str2 ]
then
	echo -e "both strings are not same\n"
else
	echo -e "this is not a valid claim\n"  #NOTICE - no solo comment (there must be some statement inside else)
fi

if [ -n "baal" ]; then
	echo -e "string is not null(an empty string)\n"
fi

if [ -z "" ]; then
	echo -e "string is null(an empty string)\n"
fi

if [ -z $str ]; then
	echo -e "string is null(an empty string)"
fi

echo -e "-------------------------------------\n"

# if-else statement (arithmetic comparison)

var1=23
var2=47

if [ $var1 -eq $var2 ]; then
	echo -e "they are equal\n"
elif [ $var1 -ne $var2 ]; then
	echo -e "they are not equal\n"
else
	echo -e "this is not a valid claim\n"
fi

if [ `expr 50 + 4` -gt $var2 ]; then  #NOTICE: concept of expression
	echo -e "greater\n"
fi

if [ `expr 43 + 4` -ge $var2 ]; then
	echo -e "greater or equal\n"
fi

if [ $var1 -lt $var2 ]; then
	echo -e "less\n"
fi

if [ $var1 -le $var2 ]; then
	echo -e "less or equal\n"
fi

if [ ! $var1 -gt $var2 ]; then  #NOTICE: use of !
	echo -e "less or equal\n"
fi

if [ ! $var1 -ge $var2 ]; then
	echo -e "less\n"
fi

echo -e "-------------------------------------\n"

# if-else statement (file comparison)

ls -l
echo ""

if [ -d dir0 ]; then
	echo -e "dir0 is a directory\n"
fi

if [ ! -d temp0.txt ]; then
	echo -e "temp0.txt is not a directory\n"
fi

if [ -f temp0.txt ]; then
	echo -e "temp0.txt is a file\n"
fi

if [ -s temp0.txt ]; then
	echo -e "temp0.txt is a non-zero size/Byte file\n"
fi

if [ -r temp0.txt ]; then
	echo -e "temp0.txt is readable\n"
fi

if [ -w temp0.txt ]; then
	echo -e "temp0.txt is writable\n"
fi

if [ ! -x temp0.txt ]; then
	echo -e "temp0.txt is not executable\n"
fi

if [ -x basic.sh ]; then
	echo -e "basic.sh is executable\n"
fi

if [ -e basic.sh ]; then  #NOTICE
	echo -e "basic.sh exists\n"
fi

if [ ! -g basic.sh ]; then  #NOTICE
	echo -e "basic.sh: set-group-id is not set\n"
fi

if [ ! -u 1605023_2.sh ]; then  #NOTICE
	echo -e "basic.sh: set-user-id is not set\n"
fi

echo -e "-------------------------------------\n"

# case

echo -n "is it spring/summer/autumn/winter now? "
read season

case $season in
	spring|Spring) echo -e "\nspring is refreshing";;
	summer|Summer) echo -e "\nsummer is wonderful";;
	autumn|Autumn) echo -e "\nautumn in serene";;
	winter|Winter) echo -e "\nwinter is harsh";;
	*) echo -e "\nthere is no such season as $season";;
esac

echo -e -n "\nenter a number: "
read var1

case `expr $var1 % 2` in  #NOTICE: important use of `expr `
	0) echo -e "\n$var1 is even";;
	1) echo -e "\n$var1 is odd";;
	*) echo -e "\nthis is an invalid claim";;
esac

echo -e -n "\nyes or no? "
read str1

case "$str1" in
	y*|Y*) echo -e -n "\nyou said "
		   echo "YES";;
	n*|N*) echo -e -n "\nyou said "
		   echo "NO";;
	*) echo -e "never mind";;
esac

echo -e "\n-------------------------------------\n"

