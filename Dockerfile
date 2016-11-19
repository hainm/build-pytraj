FROM quay.io/pypa/manylinux1_x86_64
ADD ci ci
RUN sh ci/build_deps.sh
RUN rm -rf ci
