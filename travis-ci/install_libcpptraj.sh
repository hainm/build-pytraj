#!/bin/sh

git clone https://github.com/amber-md/cpptraj
cd cpptraj
./configure -shared -openmp -nobzlib gnu
make libcpptraj -j4
cd ..
