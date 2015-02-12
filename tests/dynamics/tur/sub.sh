#!/bin/bash

rm *.log
rm fort*

bsub -q simul -n 8 -a openmp -R "span[hosts=1]"  -o sh.log -e sh.err -i dyn.in main_sh.exe


