#!/bin/bash
set -e -x

yum -y install bzip2
yum -y install atlas.x86_64 blas.x86_64 lapack.x86_64
yum -y install zlib-devel bzip2-devel netcdf-devel
yum -y install gfortran fftw3-devel

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
source /io/ci/install_libcpptraj.sh
export CPPTRAJHOME=`pwd`/cpptraj/
${PYBIN}/pip wheel --no-deps -w wheelhouse/ .

for whl in wheelhouse/pytraj*.whl; do
        auditwheel repair $whl -w /io/wheelhouse/
done

${PYBIN}/pip install pytraj --no-index -f /io/wheelhouse
cd $HOME; ${PYBIN}/python -c 'import pytraj; print(pytraj)'
