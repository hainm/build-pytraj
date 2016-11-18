#!/bin/sh

yum -y install bzip2
yum -y install blas-devel
yum -y install lapack-devel
yum -y install arpack-devel
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install netcdf-devel
yum -y install gfortran
yum -y install libgfortran
yum -y install fftw3-devel
wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/marcindulak/CentOS_CentOS-5/x86_64/netcdf4-4.1.2-23.1.x86_64.rpm
rpm -i ./tcdf4-4.1.2-23.1.x86_64.rpm
