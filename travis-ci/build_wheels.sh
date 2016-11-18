#!/bin/bash
set -e -x

if [ "${USE_MINICONDA}" = "true" ]; then
    source /io/travis-ci/set_env.sh
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
${PYBIN}/python setup.py build
export CPPTRAJHOME=`pwd`/cpptraj/
${PYBIN}/pip wheel --no-deps -w wheelhouse/ .

for whl in wheelhouse/pytraj*.whl; do
        auditwheel repair $whl -w /io/wheelhouse/
done

${PYBIN}/pip install pytraj --no-index -f /io/wheelhouse
cd $HOME; ${PYBIN}/python -c 'import pytraj; print(pytraj)'
