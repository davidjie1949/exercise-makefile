CC := gcc
CXX := g++
CXXFLAGS = --std=c++11 -fPIC -O2 -MMD -MP -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-ignored-qualifiers
MKDIR_P ?= mkdir -p

TARGET_APP ?= test
TARGET_LIB ?= libtest.so

BUILD_TARGET ?= $(shell uname -m)

OUT_DIR := out/$(BUILD_TARGET)
BIN_DIR := $(OUT_DIR)/bin
LIB_DIR := $(OUT_DIR)/lib
OBJ_DIR := $(OUT_DIR)/obj
SRC_DIR := src

INC_DIRS = -Iinclude
CPPFLAGS = $(INC_DIRS)

APP_SRC := $(notdir $(shell find $(SRC_DIR) -name '*.cpp'))	# sort out all *.cpp without directory
APP_OBJ := $(APP_SRC:%.cpp=$(OBJ_DIR)/%.o)				    # find corresponding .o files via .cpp
LIB_OBJ := $(filter-out $(OBJ_DIR)/main.o, $(APP_OBJ))      # remove main.o in all .o files

DEPS := $(APP_OBJ:.o=.d)									# create dependency tracking
-include $(DEPS)

all: $(TARGET_APP) $(TARGET_LIB)							# build app and shared library

$(TARGET_APP): $(APP_OBJ)									# build app, directory, bash command
	@$(MKDIR_P) $(BIN_DIR)
	$(CXX) -o $(BIN_DIR)/$@ $^

$(TARGET_LIB): $(LIB_OBJ)									# build shared library, directory, bash command
	@$(MKDIR_P) $(LIB_DIR)
	$(CXX) -shared -o $(LIB_DIR)/$@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp							# follow the pattern rules(%), build object files
	@$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: clean

clean:
	@echo "cleaning up ... "
	$(RM) -r out