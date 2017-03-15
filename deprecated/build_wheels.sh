#!/bin/bash
set -e -x

if [ ! -d pytraj ]; then
    git clone https://github.com/amber-md/pytraj
fi

cd pytraj

if [ ! -d cpptraj/lib/libcpptraj.so ]; then
    source /io/ci/install_libcpptraj.sh
fi

for PYVER in cp27-cp27m cp34-cp34m cp35-cp35m; do
    export PYBIN=/opt/python/${PYVER}/bin
    export PATH=$PYBIN:$PATH
    echo ${PYVER}
    
    # Compile wheels
    echo "building for ${PYBIN}"
    ${PYBIN}/python --version
    export CPPTRAJHOME=`pwd`/cpptraj/
    ${PYBIN}/pip wheel --no-deps -w wheelhouse/ .
    ls wheelhouse/
    
    for whl in wheelhouse/pytraj*.whl; do
        auditwheel repair $whl -w /io/wheelhouse/
    done
    
    ${PYBIN}/pip install pytraj --no-index -f /io/wheelhouse
    cd $HOME; ${PYBIN}/python -c 'import pytraj; pytraj.run_tests()'

cd ..
