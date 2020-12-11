CC := gcc
C++ := g++
CFLAGS := -lm -Wall -g
TARGETS := test
OBJ := tool.o

BUILD_TARGET ?= $(shell uname -m)

OUR_DIR := out/$(BUILD_TARGET)
BIN_DIR := $(OUT_DIR)/bin
LIB_DIR := $(OUT_DIR)/lib
OBJ_DIR := $(OUT_DIR)/obj
SRC_DIR := src

$(TARGETS): main.cpp $(OBJ)
	$(C++) $(CFLAGS) main.cpp $(OBJ) -o $(TARGETS)

$(OBJ): tool.cpp
	$(C++) -c tool.cpp

clean:
	@echo "cleaning up ... "
	rm -f $(TARGETS) $(OBJ)