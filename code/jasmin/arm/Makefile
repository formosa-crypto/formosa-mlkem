# Define the compiler
JASMINC = jasminc

# Define the target executable
TARGET = mlkem-768-arm.s

# Define the source files
SRCS = kem.jazz

# Define the compilation flags
JFLAGS = -arch arm-m4

# Default target
all: $(TARGET)

# Rule to build the target
$(TARGET): $(SRCS)
	$(JASMINC) $(JFLAGS) $(SRCS) -o $(TARGET)


# Clean up
clean:
	rm -f $(TARGET)
