#!/bin/sh

: "${NETUTILS_IMAGE:=ghcr.io/larsks/netutils:latest}"
: "${NETUTILS_PULL_POLICY:=always}"

if [ -z "$*" ]; then
	set -- bash
fi

if podman ps --format json | jq '[.[].Names[]]|index("netutils")' | grep -q '[0-9]'; then
	echo "Entering already running container" >&2
	podman exec -it netutils "$@"
else
	podman run --pull="${NETUTILS_PULL_POLICY}" --replace -it --rm \
		--name netutils \
		--privileged \
		--net=host \
		--pid=host \
		-v /run/openvswitch:/run/openvswitch \
		-v /sys/kernel:/sys/kernel \
		-v /lib/modules:/lib/modules \
		-v /:/host \
		-w /host/root \
		"${NETUTILS_IMAGE}" \
		"$@"
fi
