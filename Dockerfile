ARG PWRU_VERSION="0.0.7"
ARG BPFTRACE_VERSION="cf54d1682c19c0b2ebc7f81160282345c0aded79-alpine"

FROM docker.io/cilium/pwru:${PWRU_VERSION} AS pwru
FROM quay.io/iovisor/bpftrace:${BPFTRACE_VERSION} AS bpftrace

FROM docker.io/fedora:37

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
    darkhttpd

COPY --from=pwru /usr/local/bin/pwru /usr/local/bin/pwru
COPY --from=bpftrace /usr/bin/bpftrace /usr/local/bin/bpftrace

COPY netutils.sh /scripts/netutils.sh
LABEL INSTALL podman run --rm -v \$OPT1:/target \$IMAGE \
    install -m 755 /scripts/netutils.sh /target/netutils
