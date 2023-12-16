#!/bin/bash
/opt/AMD/aocc-compiler-4.1.0/bin/clang -O2 -fopenmp -mcmodel=large -ffp-contract=fast -fnt-store stream.c -DSTREAM_TYPE=double -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=100 -o stream
taskset -c 0,4 ./stream
