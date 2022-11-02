A container image with a suite of network diagnostic tools.

## Wrapper script installation

This image containers a wrapper script that calls the image with a number of useful options. To install it into `/usr/local/bin`:

```
podman container runlabel INSTALL ghcr.io/larsks/netutils:latest --opt1=/usr/local/bin
```
