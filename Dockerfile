FROM quay.io/pypa/manylinux1_x86_64
ADD ci ci
RUN sh ci/install_deps.sh
RUN rm netcdf4-4.1.2-23.1.x86_64.rpm
RUN rm netcdf4-devel-4.1.2-23.1.x86_64.rpm
RUN bash ci/install_miniconda.sh

# Do not set env below to force using system gcc
# ENV PATH=/root/miniconda3/bin:$PATH
RUN rm -rf ci
