FROM ubuntu:jammy

# TRex version
ARG VERSION="v3.04"
ARG SHA256CHECKSUM="c68d1d073811c379a5da8cc055d223006415bbcd73ad03e9554c67ee34c15c22  ${VERSION}.tar.gz"

# Never ask for user input
ARG DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update -y && \
    apt-get install -y \
        python3 \
        python3-distutils \
        python3-pip \
        wget \
        bash \
        net-tools \
        netbase \
        strace \
        iproute2 \
        iputils-ping \
        pciutils \
        vim && \
    pip install --upgrade PyYaml

RUN wget --no-check-certificate https://trex-tgn.cisco.com/trex/release/${VERSION}.tar.gz && \
    echo "${SHA256CHECKSUM}" | sha256sum --check - && \
    tar -zxvf ${VERSION}.tar.gz -C / && \
    chown root:root /${VERSION}  && \
    rm ${VERSION}.tar.gz

COPY trex_cfg.yaml /etc/trex_cfg.yaml

WORKDIR /${VERSION}
CMD ["./t-rex-64", "-i", "--cfg", "/etc/trex_cfg.yaml"]
