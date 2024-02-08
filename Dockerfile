FROM docker.io/fedora:39

RUN yum -y install \
    iproute \
    tcpdump \
    wireshark-cli \
    vim-enhanced \
    git \
    curl \
    findutils \
    procps-ng \
    nftables \
    bcc \
    bpftool \
    perf \
    strace \
    ltrace \
    trace-cmd \
    xz \
    xdp-tools \
    nmap-ncat \
    bc \
    iputils \
    net-tools \
    conntrack-tools \
    bind-utils \
    openvswitch \
    openvswitch-test \
    python3-openvswitch \
    ovn \
    iptables-nft \
    iptables-legacy \
    arptables-legacy \
    ebtables-legacy \
    iptables-utils \
    kernel-headers \
    glibc-headers \
    @development-tools \
    darkhttpd \
    dropwatch

COPY --from=docker.io/cilium/pwru:latest /usr/local/bin/pwru /usr/local/bin/pwru
COPY --from=quay.io/iovisor/bpftrace:latest /usr/bin/bpftrace /usr/local/bin/bpftrace
