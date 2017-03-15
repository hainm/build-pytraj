#!/bin/sh

export PYVER=$PYVER
if [ "$CIRCLECI" = 'true' ]; then
    export DOCKER_IMAGE=quay.io/pypa/manylinux1_x86_64
    export PYVER=cp35-cp35m
   #  export USE_MINICONDA='true'
fi
docker run -it -e "PYVER=$PYVER" --rm -v `pwd`:/io $DOCKER_IMAGE $PRE_CM bash
