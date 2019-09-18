FROM centos:centos7
#FROM cern/slc6-base

# Perform the installation as root:
USER root
ENV HOME /home/ilc
ENV ILCSOFT /home/ilc/ilcsoft

WORKDIR ${HOME}

RUN yum -y update

RUN mkdir -p ${ILCSOFT}

RUN yum install -y curl \ 
                   tar \
                   bzip2

RUN yum install -y \
        wget \
        tar \
        git \
        which \
	gcc \
	gcc-c++ \
        make \
	libX11-devel \
        libXext-devel \
        freeglut-devel \
        libXmu-devel \
        libXpm-devel \
        libXft-devel \
        python-devel \ 
        boost-devel \
        subversion \
        doxygen \
        texlive 


RUN yum install -y centos-release-scl 
RUN yum install -y devtoolset-7-gcc-c++
SHELL [ "/usr/bin/scl", "enable", "devtoolset-7"]
RUN gcc --version 


## Installing gcc73 from the source
#RUN wget http://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-7.3.0/gcc-7.3.0.tar.gz
#RUN tar zxf gcc-7.3.0.tar.gz
#WORKDIR ${HOME}/gcc-7.3.0
#RUN ./contrib/download_prerequisites
#RUN ./configure --disable-multilib --enable-languages=c,c++
#RUN make -j 32
#RUN make install

#WORKDIR ${HOME}

RUN yum install -y mysql \
                   mysql-devel 

#RUN git clone https://github.com/iLCSoft/iLCInstall.git 
RUN git clone https://github.com/rete/iLCInstall.git --branch fix-root-cmake
WORKDIR ${HOME}/iLCInstall
 
## install the base
RUN ./ilcsoft-install -i --install-prefix ${ILCSOFT} -j 30 releases/LATEST/release-base.cfg 

## Installing Eigen3 
RUN wget http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/e/eigen3-devel-3.3.4-6.el7.noarch.rpm
RUN rpm -Uvh eigen3-devel-3.3.4-6.el7.noarch.rpm 

## Delete unnecessary build folders
RUN rm -rf /home/ilc/ilcsoft/geant4/build-*
RUN rm -rf /home/ilc/ilcsoft/root/build-*
RUN rm -rf /home/ilc/ilcsoft/Qt5/v5.13.1/build

RUN ./ilcsoft-install -i --install-prefix ${ILCSOFT} releases/LATEST/release-ilcsoft.cfg
# Start the image with BASH by default
CMD ["/bin/bash"]
