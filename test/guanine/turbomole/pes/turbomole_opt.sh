#!/bin/bash


rm *.out
rm *out*
rm job*


bsub -W 1:0 -n 2 -q x64_3950 -m "T_TurboMole_x64_3950" -o dscf.out -e %J.err -J single turbomole.lsf "dscf" 

#bsub -W 1:0 -n 8 -q x64_3950 -m "T_TurboMole_x64_3950" -o %J.out -e %J.err -J freq turbomole.lsf "jobex -c 500"

#bsub -W 1:0 -n 8 -q x64_3950 -m "T_TurboMole_x64_3950" -o %J.out -e %J.err -J freq turbomole.lsf "aoforce"
