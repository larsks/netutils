FROM quay.io/fedora/fedora:44

ARG PWRU_VERSION=v1.0.12
ARG BPFTRACE_VERSION=v0.27.1

COPY --from=docker.io/cilium/pwru:${PWRU_VERSION} /usr/local/bin/pwru /usr/local/bin/pwru
COPY --from=quay.io/iovisor/bpftrace:latest /usr/bin/bpftrace /usr/local/bin/bpftrace

RUN curl -o /usr/bin/bpftrace -Ssf -L https://github.com/bpftrace/bpftrace/releases/download/${BPFTRACE_VERSION}/bpftrace-x86_64 && chmod 755 /usr/bin/bpftrace

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
