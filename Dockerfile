FROM docker.io/cilium/pwru:latest AS pwru

FROM docker.io/fedora:37

#RUN yum install -y https://repos.fedorapeople.org/repos/openstack/openstack-yoga/rdo-release-yoga-1.el8.noarch.rpm

RUN yum -y install \
    iproute \
    tcpdump \
    vim-enhanced \
    git \
    curl \
    findutils \
    procps-ng \
    nftables \
    bcc \
    bpftool \
    bpftrace \
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
    @development-tools

COPY --from=pwru /usr/local/bin/pwru /usr/local/bin/pwru

COPY netutils.sh /scripts/netutils.sh
LABEL INSTALL podman run --rm -v \$OPT1:/target \$IMAGE \
    install -m 755 /scripts/netutils.sh /target/netutils
