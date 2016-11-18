#!/bin/bash
set -e -x

echo ${PYVER}
PYBIN=/opt/python/${PYVER}/bin
# Compile wheels
echo "building for ${PYBIN}"
git clone https://github.com/amber-md/pytraj
cd pytraj
${PYBIN}/python setup.py build
export CPPTRAJHOME=`pwd`/cpptraj/
${PYBIN}/pip wheel --no-deps -w wheelhouse/ .

for whl in wheelhouse/pytraj*.whl; do
        auditwheel repair $whl -w /io/wheelhouse/
done

${PYBIN}/pip install pytraj --no-index -f /io/wheelhouse
cd $HOME; ${PYBIN}/python -c 'import pytraj; print(pytraj)'
