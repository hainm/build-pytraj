#!/bin/sh

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    wget http://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh;
else
    wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
fi

bash miniconda.sh -b

export PATH=$HOME/miniconda3/bin:$PATH
export LD_LIBRARY_PATH=$HOME/miniconda3/lib:$LD_LIBRARY_PATH

conda install -y  \
    cython \
    numpy \
    nomkl \
    openblas \
    zlib \
    bzip2 \
    libnetcdf \
    libgfortran \
    gcc
