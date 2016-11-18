#!/bin/bash
set -e -x

yum -y install bzip2
yum -y install atlas.x86_64
yum -y install blas.x86_64
yum -y install lapack.x86_64
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install netcdf-devel
yum -y install gfortran
yum -y install fftw3-devel

if [ "${USE_MINICONDA}" = "true" ]; then
    source /io/ci/setup_env.sh
    export PYVER=3.5
    export PYBIN=$HOME/miniconda3/bin/
    export PATH=$PYBIN:$PATH
else
    export PYBIN=/opt/python/${PYVER}/bin
    export PATH=$PYBIN:$PATH
    echo ${PYVER}
fi
# Compile wheels
echo "building for ${PYBIN}"
git clone https://github.com/amber-md/pytraj
cd pytraj
${PYBIN}/python --version
${PYBIN}/python -m pip install cython
source /io/ci/install_libcpptraj.sh
export CPPTRAJHOME=`pwd`/cpptraj/
${PYBIN}/pip wheel --no-deps -w wheelhouse/ .

for whl in wheelhouse/pytraj*.whl; do
        auditwheel repair $whl -w /io/wheelhouse/
done

${PYBIN}/pip install pytraj --no-index -f /io/wheelhouse
cd $HOME; ${PYBIN}/python -c 'import pytraj; print(pytraj)'
