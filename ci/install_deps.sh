#!/bin/sh

for PYVER in cp27-cp27mu cp27-cp27m cp34-cp34m cp35-cp35m cp36-cp36m cp37-cp37m cp38-cp38; do
    echo ${PYVER}
    export PYBIN=/opt/python/${PYVER}/bin
    export PATH=$PYBIN:$PATH
    echo ${PYVER}
    ${PYBIN}/python --version
    ${PYBIN}/python -m pip install --upgrade pip setuptools
    ${PYBIN}/python -m pip install Cython
    ${PYBIN}/python -m pip install numpy
    ${PYBIN}/python -m pip install auditwheel
done

yum -y install bzip2
yum -y install blas-devel
yum -y install lapack-devel
yum -y install arpack-devel
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install gfortran
yum -y install libgfortran
yum -y install fftw3-devel
yum -y install netcdf
yum -y install netcdf-devel
yum -y install wget
