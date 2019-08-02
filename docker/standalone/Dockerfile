FROM centos:centos7
#FROM cern/slc6-base

# Perform the installation as root:
USER root
ENV HOME /home/ilc
ENV ILCSOFT /home/ilc/ilcsoft
ENV SQL /afs/desy.de/project/ilcsoft/sw/x86_64_gcc48_sl6/mysql/5.0.45/
WORKDIR ${HOME}

RUN mkdir -p ${ILCSOFT}

RUN yum install -y curl \ 
                   tar \
                   bzip2

RUN yum install -y \
        wget \
        tar \
        git \
        gcc \
        gcc-c++ \
        g++ \ 
        which \
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


RUN yum -y update
RUN yum install -y centos-release-scl 
RUN yum install -y devtoolset-3-gcc devtoolset-3-gcc-c++
SHELL [ "/usr/bin/scl", "enable", "devtoolset-3"]
RUN gcc --version 


RUN yum install -y mysql \
                   mysql-devel 

#RUN git clone https://github.com/iLCSoft/iLCInstall.git 
RUN git clone https://github.com/rete/iLCInstall.git --branch fix-root-cmake
WORKDIR ${HOME}/iLCInstall
 
## install the base
RUN ./ilcsoft-install -i --install-prefix ${ILCSOFT} releases/v02-00/release-base.cfg 

## Installing Eigen3 
RUN wget http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/e/eigen3-devel-3.3.4-6.el7.noarch.rpm

## Delete unnecessary build folders
RUN rm -rf /home/ilc/ilcsoft/geant4/build-10.03.p02
RUN rm -rf /home/ilc/ilcsoft/root/build-6.16.00

RUN ./ilcsoft-install -i --install-prefix ${ILCSOFT} releases/v02-00/release-ilcsoft.cfg
# Start the image with BASH by default
CMD ["/bin/bash"]
