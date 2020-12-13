CC := gcc
C++ := g++
CFLAGS := -lm -Wall -g
TARGETS := test
OBJS := main.o tool.o

# libtest.so: $(OBJ)
# 	$(C++) -shared -o $@ $^

ALL: $(TARGETS)
DEPS := $(patsubst %.o, %.d, $(OBJS))
-include $(DEPS)
DEPFLAGS = -MMD -MF $(@:.o=.d)

test: $(OBJS)
	$(C++) $(CFLAGS) -o $@ $^

%.o: %.cpp
	$(C++) $(CFLAGS) -fPIC -c $< $(DEPFLAGS)
	
clean:
	@echo "cleaning up ... "
	rm $(TARGETS) $(OBJS) *.so *.o *.d
	@echo "cleaned successfully!"