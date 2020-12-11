CC := gcc
C++ := g++
CFLAGS := -lm -Wall -g
TARGETS := test
OBJ := tool.o

libtest.so: main.o $(OBJ)
	$(C++) -shared -o libtest.so main.o $(OBJ)

# $(TARGETS): main.cpp $(OBJ)
# 	$(C++) $(CFLAGS) main.cpp $(OBJ) -o $(TARGETS)

main.o: main.cpp
	$(C++) -fPIC -c main.cpp

$(OBJ): tool.cpp
	$(C++) -fPIC -c tool.cpp



clean:
	@echo "cleaning up ... "
	rm -f $(TARGETS) $(OBJ) *.so