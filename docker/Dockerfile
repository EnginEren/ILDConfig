FROM centos:centos7

# Perform the installation as root:
USER root
ENV HOME /home/ilc
WORKDIR ${HOME}


# epel-release must be installed before some other libraries
RUN yum upgrade -y -q && \
    yum install -y \
        gcc \
        gcc-c++ \
        zlib-devel \
        openssl-devel \
        sqlite-devel \
        make \
        wget \
        git \
        which \
        tar \
        sudo \
        tree \
        epel-release && \
    yum install -y \
        jq \
        hdf5-devel \
        patch \
        bzip2-devel \
        gdbm-devel \
        xz-devel \
        ncurses-devel \
        readline-devel \
        libuuid-devel \
        libffi-devel \
        tk-devel \
        bash-completion \
        bash-completion-extras && \
    yum clean all


## python2.7 installation
RUN wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz
RUN tar xvfJ Python-2.7.8.tar.xz
WORKDIR Python-2.7.8
RUN ./configure --prefix=/usr/local && make && make altinstall
RUN curl https://bootstrap.pypa.io/get-pip.py | python2.7
RUN pip install opencv-python
RUN yum install -y libXext libSM libXrender libXmu

## switch back to home 
WORKDIR ${HOME}

# Add h5ls tab completion
RUN git clone --depth 1 https://github.com/dguest/_h5ls.git /opt/_h5ls && \
    echo $'\n# Enable h5ls tab completion\n\
if [ -f /opt/_h5ls/_h5ls.sh ]; then\n\
    . /opt/_h5ls/_h5ls.sh\n\
fi'\
>> ${HOME}/.bashrc

# Add alias for vim
RUN printf "\nalias vim=vi\n" >> ${HOME}/.bashrc

# Make images Grid / Singularity compatible
RUN mkdir -p /cvmfs /afs /eos

# Set up the ILC user, give it super user rights, and give ownership of ${HOME}.
RUN echo '%wheel	ALL=(ALL)	NOPASSWD: ALL' >> /etc/sudoers && \
    adduser ilc && \
    usermod -aG wheel ilc && \
    cp /root/.bash* ${HOME}/ && \
    mkdir ${HOME}/data && \
    chown -R --from=root ilc ${HOME}

USER ilc

# Start the image not in /root to protect config files
WORKDIR ${HOME}/data

# Start the image with BASH by default
CMD ["/bin/bash"]
