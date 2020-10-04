compiler = g++ 

executable: main.o hello_world.o among_us.o
	$(compiler) -o out *.o

object: main.cpp hello_world.cpp among_us.cpp header.hpp
	$(compiler) -c *.cpp  # also works for $(compiler) -o out *.cpp

clean:
	rm *.o out

