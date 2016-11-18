#!/bin/sh
export PYVER=$PYVER
docker run -e "PYVER=$PYVER" --rm -v `pwd`:/io $DOCKER_IMAGE $PRE_CM bash /io/travis-ci/build_wheels.sh
ls wheelhouse/
