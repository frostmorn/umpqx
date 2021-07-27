SHELL = /bin/sh
SYSTEM = $(shell uname)
C++ = g++
DFLAGS = -DGHOST_MYSQL
OFLAGS = -O3
LFLAGS = -L./StormLib  -Wl,-Bstatic -lstorm  -Wl,-Bdynamic -ldl -lbz2 -lz
CFLAGS = -g3 -Wall

OBJS = umpqx.o
PROGS = ./umpqx

all: $(OBJS) $(PROGS)

./umpqx: $(OBJS) $(COBJS)
	$(C++) -o ./umpqx $(OBJS) $(COBJS) $(LFLAGS)

clean:
	rm -f $(OBJS) $(COBJS) $(PROGS)

$(OBJS): %.o: %.cpp
	$(C++) -o $@ $(CFLAGS) -c $<

./umpqx: $(OBJS) $(COBJS)

all: $(PROGS)

umpqx.o: umpqx.cpp
