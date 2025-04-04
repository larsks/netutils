# netutils

A container image with a suite of network diagnostic tools.

## Running the image

```
podman run --replace -it --rm \
  --name netutils \
  --privileged \
  --net=host \
  --pid=host \
  -v /root:/root \
  -v /run/openvswitch:/run/openvswitch \
  -v /sys/kernel:/sys/kernel \
  -v /lib/modules:/lib/modules \
  -v /:/host \
  -w /root \
  ghcr.io/larsks/netutils:main
```
