definition:

	GNU-make is a utility which automatically determines which pieces of a large program need to be recompiled. GNU-make issues the commands in the form of Makefile to recompile them.

basic-structure:

	target: dependencies
		recipe1/action1
		recipe2/action2
		...
	
description:

	target		  -> target-file/rule-name
				  -> file that is needed to be created
	dependencies  -> what are required to perform actions 
				  -> recreate target-file when any of the dependencies is changed/updated
    recipe/action -> commands to create target-file from dependencies

caution:

	1) makefile's name should be "Makefile"
	2) basic-structure is called a "rule"
	3) basic-structure must have given spacing because Makefile is whitespace-sensitive
	4) *.o rules are necessary in absence of *.o files 

steps:

	1) make ("make" commnad will not work if primary-target/executalbe/output or out is up-to-date that is all dependencies involved are up-to-date)
	2) ./out (execute program)
	3) make clean (invoke clean rule in Makefile)
	
reference-link:
	youtube: https://www.youtube.com/watch?v=_r7i5X0rXJk&t=314s

