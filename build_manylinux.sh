#!/bin/sh
export PYVER=$PYVER

if [ "$CIRCLECI" = 'true' ]; then
    export DOCKER_IMAGE=quay.io/pypa/manylinux1_x86_64
    export PYVER=cp35-cp35m
    yum install bzip2 -y
fi
docker run -e "PYVER=$PYVER" -e "USE_MINICONDA=${USE_MINICONDA}" --rm -v `pwd`:/io $DOCKER_IMAGE $PRE_CM bash /io/travis-ci/build_wheels.sh
ls wheelhouse/
