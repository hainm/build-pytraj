#!/bin/sh

git clone https://github.com/amber-md/pytraj
cd pytraj
git fetch
git checkout `git tag | tail -1`

devtools/mkrelease

git clone https://github.com/amber-md/cpptraj
# cpptraj
cd cpptraj 
git fetch
git checkout master 
git pull 
export CPPTRAJHOME=`pwd`
cd ..

platform=`uname`
if [ "$platform" = 'Linux' ]; then
    python scripts/install_libcpptraj.py -openmp
else
    python scripts/install_libcpptraj.py
fi

cd dist
python ../scripts/build_wheel.py pytraj*gz