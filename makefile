CC := gcc
C++ := g++
CFLAGS := -lm -Wall -g
TARGETS := test
OBJ := main.o tool.o

# libtest.so: $(OBJ)
# 	$(C++) -shared -o $@ $^

$(TARGETS): $(OBJ)
	$(C++) $(CFLAGS) -o $@ $^

%.o: %.cpp tool.hpp
	$(C++) -fPIC -c $*.cpp
	
clean:
	@echo "cleaning up ... "
	rm $(TARGETS) $(OBJ) *.so *.o
	@echo "cleaned successfully!"