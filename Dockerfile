FROM ubuntu:focal

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    gcc \
    git \
    libssl-dev \
    libcurl4-openssl-dev \
    python3-dev \
    python3-pip \
    r-base \
    samtools \
    wget \
    zlib1g-dev

RUN pip3 install RSeQC
RUN pip3 install git+https://github.com/betsig/how_are_we_stranded_here.git

##########
#Kallisto#
##########
RUN mkdir /opt/kallisto && cd /opt/kallisto && \
    wget https://github.com/pachterlab/kallisto/releases/download/v0.46.1/kallisto_linux-v0.46.1.tar.gz && \
    tar -xzvf kallisto_linux-v0.46.1.tar.gz && ln -s /opt/kallisto/kallisto_linux-v0.46.1/kallisto /usr/bin/kallisto
