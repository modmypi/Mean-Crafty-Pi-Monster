#
# Makefile slapped together by Fabien Royer @ Nwazet,
# based on the wiringPi Makefile (thanks Gordon :)
# wiringPi is copyright Gordon ...
#

#DEBUG  = -g -O0
DEBUG   = -O3
CC      = gcc
INCLUDE = -I/usr/local/include
CFLAGS  = $(DEBUG) -Wall $(INCLUDE) -Winline -pipe

LDFLAGS = -L/usr/local/lib
LDLIBS    = -lwiringPi

SRC	=	mcpm.c

OBJ	=	$(SRC:.c=.o)

BINS	=	$(SRC:.c=)

mcpm:	mcpm.o
	@echo [link]
	@$(CC) -o $@ mcpm.o $(LDFLAGS) $(LDLIBS) -lm -lpthread

.c.o:
	@echo [CC] $<
	@$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJ) *~ core tags $(BINS)

tags: $(SRC)
	@echo [ctags]
	@ctags $(SRC)

depend:
	makedepend -Y $(SRC)
