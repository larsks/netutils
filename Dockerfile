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
	xdp-tools \
	python3-openvswitch

RUN ln -s nvim /usr/bin/vim

LABEL RUN podman run -it --rm --privileged \
		--name \${NAME} \
		--net=host \
		--pid=host \
		-v /run/openvswitch:/run/openvswitch \
		-v /:/host \
		-v /sys/kernel:/sys/kernel \
		-v /lib/modules:/lib/modules \
		-w /host/root \
		\${IMAGE}
