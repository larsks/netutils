A container image with a suite of network diagnostic tools.

## Wrapper script installation

This image containers a wrapper script that calls the image with a number of useful options. To install it into `/usr/local/bin`:

```
podman run --rm -v /usr/local/bin:/target ghcr.io/larsks/netutils:latest \
  install -m 755 /scripts/netutils.sh /target/netutils
```
