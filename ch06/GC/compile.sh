#!/bin/sh

OPTION=-O0
echo "============ O0 ==========="
# MRC
clang $OPTION -framework Foundation MRC.m -o MRC
echo time: MRC
time ./MRC
# ARC
clang $OPTION -fobjc-arc -framework Foundation ARC.m -o ARC
echo time: ARC
time ./ARC
# GC
clang $OPTION -fobjc-gc-only -framework Foundation GC.m -o GC
echo time: GC
time ./GC

OPTION=-Os
echo "============ Os ==========="
# MRC
clang $OPTION -framework Foundation MRC.m -o MRC
echo time: MRC
time ./MRC
# ARC
clang $OPTION -fobjc-arc -framework Foundation ARC.m -o ARC
echo time: ARC
time ./ARC
# GC
clang $OPTION -fobjc-gc-only -framework Foundation GC.m -o GC
echo time: GC
time ./GC

rm -f MRC ARC GC
