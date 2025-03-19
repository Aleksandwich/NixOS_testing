CC = gcc
CFLAGS = -Wall -O2 $(shell pkg-config --cflags sdl2) -I/nix/store/*-gl4dummies-master/include
LDFLAGS = $(shell pkg-config --libs sdl2) -L/nix/store/*-gl4dummies-master/lib -lGL4Dummies

TARGET = test
SRCS = src/test.c
OBJS = $(SRCS:.c=.o)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
