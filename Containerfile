FROM quay.io/fedora/fedora:43

COPY --from=docker.io/cilium/pwru:latest /usr/local/bin/pwru /usr/local/bin/pwru
COPY --from=quay.io/iovisor/bpftrace:latest /usr/bin/bpftrace /usr/local/bin/bpftrace

RUN yum -y upgrade
RUN yum -y install \
    arptables-legacy \
    bc \
    bcc \
    bcc-tools \
    bind-utils \
    bpftool \
    bpfmon \
    bpftop \
    bpfman \
    conntrack-tools \
    curl \
    darkhttpd \
    @development-tools \
    dropwatch \
    ebtables-legacy \
    findutils \
    git \
    glibc-headers \
    iproute \
    iptables-legacy \
    iptables-nft \
    iptables-utils \
    iputils \
    kernel-headers \
    ltrace \
    net-tools \
    nftables \
    nmap-ncat \
    openvswitch \
    openvswitch-test \
    ovn \
    perf \
    procps-ng \
    python3-openvswitch \
    strace \
    tcpdump \
    trace-cmd \
    veristat \
    vim-enhanced \
    wireshark-cli \
    xdp-tools \
    xz
  
