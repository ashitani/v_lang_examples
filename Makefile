TARGETS = test_extc balls libtest_clib.so

all: ${TARGETS}


libtest_clib.so: test_clib.c
	gcc -shared $< -o $@

test_extc: test_extc.v libtest_clib.so

%: %.v
	v $<

.PHONY: clean

clean:
	rm -rf ${TARGETS} *.dSYM