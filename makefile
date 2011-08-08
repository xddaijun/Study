###
# My Study Makefile
#

CC       = g++
CINCS    = -Iinclude 
DEFS     = -DBZ_NO_STDIO -D_FILE_OFFSET_BITS=64 -DDEBUG -D_POSIX_C_SOURCE=2
DEFS    += -DHAVE_GDB
CFLAGS   = -std=c99 -pedantic -Wall -Wextra $(CINCS) -g -fno-common $(DEFS)
LDFLAGS  = -lm -lpthread -lz
VPATH    = test:src

###
# Objects
###

OBJS = \
dlist.o       


TEST_OBJS = \
test_dlist.o     


MY_OBJS = $(OBJS) $(TEST_OBJS)

###
# Common Targets
###

all: libstudyalgor.a

libstudyalgor.a: $(OBJS) 
	@echo Generating library: $@ ...
	@$(AR) -cru $@ $^

test: testall
	@./testall -q -v

testall: $(TEST_OBJS) libstudyalgor.a
	@echo Building task: $@ ...
	@$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	@rm -f  $(MY_OBJS) 
	@rm -f  libstudyalgor.a testall 

