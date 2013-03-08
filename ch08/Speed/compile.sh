#!/bin/sh

LOOP=8000

clang -Wall -c testObj.m
if [ $? -ne 0 ]; then exit 1; fi

# 1. message passing
# 2. reflection
# 3. function pointer
# 4. procedure
for f in message.m performSelector.m funcp.m procedure.m
do
    echo "source: $f"
    clang -Wall -framework Foundation testObj.o $f -DLOOP=8000 -O2
    if [ $? -ne 0 ]; then exit 1; fi
    time ./a.out
    echo "done\n"
done

rm -f a.out testObj.o
