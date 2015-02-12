#!/bin/bash

rm *.log
rm *.err
rm core*



bsub -q simul -n 4 -a openmp -R "span[hosts=1]" -o freq.log -e freq.err g09 freq.com

	
