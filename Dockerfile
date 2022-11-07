FROM docker.io/fedora:36

RUN yum -y install \
    iproute \
    tcpdump \
    vim-enhanced \
    openvswitch \
    git \
    curl \
    findutils \
    procps-ng \
    nftables \
    iptables-legacy \
    iptables-nft \
    bcc \
    bpftool \
    bpftrace \
    perf \
    strace \
    ltrace \
    trace-cmd \
    xz \
    xdp-tools \
    python3-openvswitch \
    nmap-ncat \
    bc \
    net-tools \
    conntrack-tools \
    bind-utils

COPY netutils.sh /scripts/netutils.sh
LABEL INSTALL podman run --rm -v \$OPT1:/target \$IMAGE \
    install -m 755 /scripts/netutils.sh /target/netutils
