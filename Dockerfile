FROM docker.io/fedora:36

RUN yum -y install \
	iproute \
	tcpdump \
	neovim \
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
	xdp-tools

RUN ln -s nvim /usr/bin/vim
