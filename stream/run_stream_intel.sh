#!/bin/bash
export LD_LIBRARY_PATH=/opt/intel/oneapi/compiler/2024.0/lib:$LD_LIBRARY_PATH
/opt/intel/oneapi/compiler/2024.0/bin/icx -xCORE-AVX2 -O3 -qopenmp -mcmodel=large -qopt-streaming-stores always stream.c -DSTREAM_TYPE=double -DSTREAM_ARRAY_SIZE=100000000 -DNTIMES=100 -o stream
taskset -c 0,2 ./stream
