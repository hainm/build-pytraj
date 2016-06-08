#!/bin/sh

git clone https://github.com/amber-md/pytraj
cd pytraj

devtools/mkrelease

git clone https://github.com/amber-md/cpptraj
# cpptraj
cd cpptraj 
git checkout master 
git pull 
export CPPTRAJHOME=`pwd`
cd ..

python scripts/install_libcpptraj.py -openmp
cd dist
python ../scripts/build_wheel.py pytraj*gz
