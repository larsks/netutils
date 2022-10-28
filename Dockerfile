FROM docker.io/fedora:36

RUN yum -y install \
	iproute \
	tcpdump \
	neovim \
	openvswitch \
	git \
	curl \
	findutils \
	procps-ng

RUN ln -s nvim /usr/bin/vim
