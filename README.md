# TRex Traffic Generator

This repository contains dockerized TRex Traffic Generator developed by Cisco.

[Link to the original repo from Github](https://github.com/CiscoIOx/TRexAppHosting)

[TRex Manual](https://trex-tgn.cisco.com/trex/doc/trex_manual.html)

### How to use

[TRex inside Docker](https://trex-tgn.cisco.com/trex/doc/trex_vm_manual.html#docker)

### Examples

1. Run application with default settings:
```docker run --rm -ti --privileged --cap-add=ALL quay.io/mksmki/trex:latest```

1. Run application with custom configuration file:
```docker run --rm -ti --privileged --cap-add=ALL -v <path to trex_cfg.yaml>:/etc/trex_cfg.yaml quay.io/mksmki/trex:latest```
