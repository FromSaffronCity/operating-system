#!/bin/bash


#################### tasks-1,2,3,4 ####################

# processing command line arguments
working_directory=`pwd`  # working directory is root/directory where script file is located
inputfile_name=""
current_directory=`pwd`

if [ $# = "0" ]; then
	echo "no cmd line arg: working directory name (optional) and input file name must be given"

elif [ $# = "1" ]; then
	if [[ $1 == *".txt"* ]]; then  # IMPORTANT: double bracket
		find ./ -type f -name $1 | grep -q $1 > /dev/null && inputfile_name=$1  # input file must be in the same directory as shell script
	else
		echo "input file name must be given"
		find ./ -type d -name $1 | grep -q $1 > /dev/null && working_directory=`find ./ -type d -name $1`  # working directory set (if exists)
	fi

elif [ $# = "2" ]; then
	if [[ $2 == *".txt"* ]]; then  # IMPORTANT: double bracket
		find ./ -type f -name $2 | grep -q $2 > /dev/null && inputfile_name=$2 # assuming, dir_name will precede input file name (if given)
	else
		echo "input file name must be given"
	fi	

	find ./ -type d -name $1 | grep -q $1 > /dev/null && working_directory=`find ./ -type d -name $1` 

else
	echo "too much cmd line arg: only working directory name (optional) and input file name must be given"
fi

# taking input file name if not provided properly
until [ "$inputfile_name" != "" ]
do
	echo -n "give valid input file name: "
	read temp

	if [[ $temp == *".txt"* ]]; then  # IMPORTANT: double bracket
		find ./ -type f -name $temp | grep -q $temp > /dev/null && inputfile_name=$temp
	fi
done	

# inserting input parameters from input file into array
IFS=$'\n'  # NOTICE: to include whitespace in array insertion opt. from files/output of commands
inputfile_content=( `cat $inputfile_name` )

# setting up directory for further operations
cd $working_directory

# deleting output_dir from the root working directory or its sub-directories if exists
output_directory=`find ./ -type d -name "1605023_output_dir"`
rm -f -r $output_directory

# deleting output.csv from the root working directory or its sub-directories if exists
csv_directory=`find ./ -type f -name "1605023_output.csv"`
rm -f $csv_directory

###################################################


#################### tasks-5,6 ####################

# finding readable text files (ASCII, Unicode)
readable_textfiles=( `find ./ -type f -exec file {} \; | grep -i 'ascii\|unicode' | awk -F':' '{print $1}'` )

# creating output directory outside root working directory
cd $current_directory  # NOTICE
cd $working_directory  
cd ..  # just outside the root working directory

rm -f -r 1605023_output_dir  # remove output_dir if existed before
mkdir 1605023_output_dir  

cd 1605023_output_dir
output_directory=`pwd`
cd ..
cd $working_directory

# counting and gathering matched files in output_dir
counter=0

for((i=0;i<${#readable_textfiles[*]};i++))
do
	if [ "${inputfile_content[0]}" = "begin" ]; then
		if head -n ${inputfile_content[1]} "${readable_textfiles[$i]}" | grep -i "${inputfile_content[2]}" > /dev/null; then
			cp "${readable_textfiles[$i]}" $output_directory
			relative_path[$counter]=${readable_textfiles[$i]}
			file_name[$counter]=`echo ${readable_textfiles[$i]} | awk -F'/' '{print $NF}'`
			counter=`expr $counter + 1`
		fi
		
	elif [ "${inputfile_content[0]}" = "end" ]; then
		if tail -n ${inputfile_content[1]} "${readable_textfiles[$i]}" | grep -i "${inputfile_content[2]}" > /dev/null; then
			cp "${readable_textfiles[$i]}" $output_directory
			relative_path[$counter]=${readable_textfiles[$i]}
			file_name[$counter]=`echo ${readable_textfiles[$i]} | awk -F'/' '{print $NF}'`
			counter=`expr $counter + 1`
			
		fi

	else
		echo "\"begin\" or \"end\" must be specified in input file"
	fi
done

################################################


#################### task-7 ####################

# extracting working directory name
working_dir_name=`pwd | awk -F'/' '{print $NF}'`

# going to output_dir
cd $output_directory

# renaming files (suffix part)
for((i=0;i<counter;i++))
do
	if [ "${inputfile_content[0]}" = "begin" ]; then
		first_occurence[$i]=`grep -i -n -m 1 ${inputfile_content[2]} ${file_name[$i]} | awk -F':' '{print $1}'`
		matched_text[$i]=`sed -n ${first_occurence[$i]}p ${file_name[$i]}`

	elif [ "${inputfile_content[0]}" = "end" ]; then
		last_occurence[$i]=`grep -i -n ${inputfile_content[2]} ${file_name[$i]} | tail -n 1 | awk -F':' '{print $1}'`
		matched_text[$i]=`sed -n ${last_occurence[$i]}p ${file_name[$i]}`

	else
		echo "\"begin\" or \"end\" must be specified in input file"
	fi
	#echo ${first_occurence[$i]} 
	#echo ${last_occurence[$i]} 
done

for((i=0;i<counter;i++))
do
	if [ "${inputfile_content[0]}" = "begin" ]; then
		temp_file_name[$i]=`echo ${file_name[$i]} | awk -F'.' '{print $1}'`
		suffix_name[$i]=`echo "${temp_file_name[$i]}_${first_occurence[$i]}"`
	elif [ "${inputfile_content[0]}" = "end" ]; then
		temp_file_name[$i]=`echo ${file_name[$i]} | awk -F'.' '{print $1}'`
		suffix_name[$i]=`echo "${temp_file_name[$i]}_${last_occurence[$i]}"`
	else
		echo "\"begin\" or \"end\" must be specified in input file"
	fi
	#echo ${file_name[$i]}
	#echo ${temp_file_name[$i]}
	#echo ${suffix_name[$i]}
done

# renaming files (prefix part)
for((i=0;i<counter;i++))
do
	relative_path[$i]=`echo ${relative_path[$i]} | sed "s/\./$working_dir_name/"`
	temp_relative_path[$i]=`echo ${relative_path[$i]} | sed 's/\//\./g'`
	#echo ${relative_path[$i]} 
done

# renaming files 
for((i=0;i<counter;i++))
do
	temp_relative_path[$i]=`echo ${temp_relative_path[$i]} | sed "s/\(.*\)${temp_file_name[$i]}/\1${suffix_name[$i]}/"`
	#echo ${relative_path[$i]} 
	mv ${file_name[$i]} ${temp_relative_path[$i]}
done

##################################################


##################### task-8 #####################

# opening .csv file
csv_file_name="1605023_output.csv"
cd ..  # moving to "just outside the root working directory"
echo "File Path, Line Number, Line Containing Searched Text" > $csv_file_name

# writing to .csv file
for((i=0;i<counter;i++))
do
	if [ "${inputfile_content[0]}" = "begin" ]; then
		echo "${relative_path[$i]}, ${first_occurence[$i]}, ${matched_text[$i]}" >> $csv_file_name

	elif [ "${inputfile_content[0]}" = "end" ]; then
		echo "${relative_path[$i]}, ${last_occurence[$i]}, ${matched_text[$i]}" >> $csv_file_name

	else
		echo "\"begin\" or \"end\" must be specified in input file"
	fi
done

##################################################


##################### task-9 #####################

# reporting the number of files that matched the criteria
echo "matched number of files: $counter"

##################################################