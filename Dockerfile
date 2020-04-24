FROM quay.io/pypa/manylinux2014_x86_64
ADD ci ci
RUN sh ci/install_deps.sh
RUN bash ci/install_miniconda.sh

# Do not set env below to force using system gcc
# ENV PATH=/root/miniconda3/bin:$PATH
RUN rm -rf ci
