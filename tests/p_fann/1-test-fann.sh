#!/bin/bash
# Author: Dries Verachtert <dries.verachtert@dries.eu>

t_Log "Running $0 - trying to compile and run a neural network with fann"

cd ./test/p_fann
gcc -o _test_fann -lm -lfann -Wall _test_fann.c
./_test_fann
cd -
