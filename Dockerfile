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
	python3-openvswitch \
	nmap-ncat

RUN ln -s nvim /usr/bin/vim

LABEL RUN podman run -it --rm --privileged \
		--name \${NAME} \
		--net=host \
		--pid=host \
		-v /run/openvswitch:/run/openvswitch \
		-v /sys/kernel:/sys/kernel \
		-v /lib/modules:/lib/modules \
		-v /var/log:/var/log \
		-v /:/host \
		-w /host/root \
		\${IMAGE}
