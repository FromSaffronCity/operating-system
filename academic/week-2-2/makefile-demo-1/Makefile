compiler = g++ 

output: main.o hello_world.o among_us.o
	$(compiler) -o out *.o

main.o: main.cpp header.hpp
	$(compiler) -c main.cpp

hello_world.o: hello_world.cpp
	$(compiler) -c hello_world.cpp

among_us.o: among_us.cpp
	$(compiler) -c among_us.cpp

clean:
	rm *.o out

