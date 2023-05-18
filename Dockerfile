FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
USER root
# Install base dependencies
RUN apt-get update && apt-get install -y locales && apt-get clean autoclean && apt-get autoremove -y

# Install requirements
RUN apt-get update && apt-get -y --no-install-recommends install \
        build-essential \
        cmake \
        git
RUN git config --global http.sslverify "false"

# install packages
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda install xeus-cling jupyterlab gcc_linux-64=9.4.0 -c conda-forge

ARG WORKSPACE_DIR=/home
ADD notebooks ${WORKSPACE_DIR}
WORKDIR ${WORKSPACE_DIR}
CMD jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8080 --NotebookApp.token="" --notebook-dir=${WORKSPACE_DIR}
