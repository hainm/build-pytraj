#!/bin/sh

for PYVER in cp27-cp27mu cp27-cp27m cp34-cp34m cp35-cp35m cp36-cp36m; do
    echo ${PYVER}
    export PYBIN=/opt/python/${PYVER}/bin
    export PATH=$PYBIN:$PATH
    echo ${PYVER}
    
    ${PYBIN}/python --version
    ${PYBIN}/python -m pip install --upgrade pip
    ${PYBIN}/python -m pip install cython
    ${PYBIN}/python -m pip install numpy
done

netcdf=ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/marcindulak/CentOS_CentOS-5/x86_64/netcdf4-4.1.2-23.1.x86_64.rpm
netcdfdev=ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/marcindulak/CentOS_CentOS-5/x86_64/netcdf4-devel-4.1.2-23.1.x86_64.rpm
yum -y install bzip2
yum -y install blas-devel
yum -y install lapack-devel
yum -y install arpack-devel
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install gfortran
yum -y install libgfortran
yum -y install fftw3-devel
wget $netcdf
wget $netcdfdev
rpm -i ./netcdf4-4.1.2-23.1.x86_64.rpm
rpm -i ./netcdf4-devel-4.1.2-23.1.x86_64.rpm

