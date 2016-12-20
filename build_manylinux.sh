#!/bin/sh

export DOCKER_IMAGE=hainm/pytraj-manylinux-build-box
docker run --rm -v `pwd`:/io \
    -a stdin -a stdout -a stderr \
    $DOCKER_IMAGE \
    bash /io/ci/build_wheels.sh
ls wheelhouse/
