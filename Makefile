SRCDIR       = .
RM           = rm
CC           = gcc
CFLAGS       = -O3 -DNDEBUG -I/usr/local/include/libhmsbeagle-1 -DUSECONFIG_H
LDFLAGS      =  -L/usr/local/lib -lhmsbeagle -lreadline -lm
INSTALL      = /usr/bin/install -c
prefix      ?= /usr/local
exec_prefix ?= ${prefix}
BINDIR      ?= ${exec_prefix}/bin

SRC       = bayes.c command.c model.c mcmc.c likelihood.c proposal.c sumpt.c utils.c mbbeagle.c best.c
OBJECTS   = bayes.o command.o model.o mcmc.o likelihood.o proposal.o sumpt.o utils.o mbbeagle.o best.o
PROGS     = mb

all: $(PROGS)

mb: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

install: $(PROGS)
	mkdir -p $(BINDIR)
	$(INSTALL) -m 755 $(PROGS) $(BINDIR)

clean:
	$(RM) -f *.o *~ mb

distclean: clean
	$(RM) -rf Makefile config.log config.status config.h *.cache

showdep:
	@$(CC) -MM $(SRC)
