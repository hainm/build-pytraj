#!/bin/bash
set -e -x

source /io/ci/build_deps.sh
export PYBIN=/opt/python/${PYVER}/bin
export PATH=$PYBIN:$PATH
echo ${PYVER}

# Compile wheels
echo "building for ${PYBIN}"
git clone https://github.com/amber-md/pytraj
cd pytraj
${PYBIN}/python --version
${PYBIN}/python -m pip install cython
${PYBIN}/python -m pip install numpy
source /io/ci/install_libcpptraj.sh
export CPPTRAJHOME=`pwd`/cpptraj/
${PYBIN}/pip wheel --no-deps -w wheelhouse/ .

for whl in wheelhouse/pytraj*.whl; do
        auditwheel repair $whl -w /io/wheelhouse/
done

${PYBIN}/pip install pytraj --no-index -f /io/wheelhouse
cd $HOME; ${PYBIN}/python -c 'import pytraj; print(pytraj)'
