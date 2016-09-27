LEX=lex
YACC=yacc
CC=gcc

LFLAGS=
CFLAGS=-Wall -Wno-unused-label -Wno-unused -g

all: cparser

cparser: cparser.lex.o
	$(CC) -o $@ $+

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<


%.lex.c: %.l
	$(LEX) $(LFLAGS) -o $@ $<

%.out: %.c cparser
	./cparser < $ < > $@

test:
	./cparser < input.cpp > test.out

clean:
	$(RM) *.o
	$(RM) *.lex.c
	$(RM) *.tex *.log *.aux *.pdf
	$(RM) cparser

.PHONY: clean all test
