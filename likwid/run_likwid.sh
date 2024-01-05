#!/bin/bash
export LD_LIBRARY_PATH=/home/mev/sandbox/likwid/lib:/opt/rocm/hip/lib:/opt/rocm/hsa/lib:/opt/rocm/rocprofiler/lib:$LD_LIBRARY_PATH
export ROCP_METRICS=/opt/rocm/rocprofiler/lib/metrics.xml
export HSA_TOOLS_LIB=librocprofiler64.so.1

while read group
do
    echo $group
    /home/mev/sandbox/likwid/bin/likwid-perfctr --output likwid.$group.txt -R $group /home/mev/source/AMDMIGraphX/build/bin/driver perf /home/mev/source/rocm-migraphx/saved-models/torchvision/resnet50i1.onnx 1> migraphx.${group}.out 2> migraphx.${group}.err
done<<GROUPS
SALU
GDS
MEM
PCI
POWER
SFETCH
STALLED
UTIL
VALU
WAVE
GROUPS



