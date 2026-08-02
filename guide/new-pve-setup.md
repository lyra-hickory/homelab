# ProxMox Virtual Environment Setup Guide

Since there are some post-installation configurations required for PVE, here is the comprehensive guide from scratch.

## Installation

Hostname: `pve0x.home.arpa`

IP Address: `192.168.0.5x / 24`

## Post-Installation

### Sources configuration

By default PVE installs with the enterprise sources enabled, but we want to switch this to the no subscription sources

First disable the enterprise sources

```bash
cd /etc/apt/sources.list.d/
```

```bash
mv pve-enterprise.sources pve-enterprise.sources.disabled
```

```bash
mv ceph.sources ceph.sources.disabled
```

Now we want to make the no-sub sources:

```bash
nano pve-no-subscription.sources
```

Then paste in the following:

```bash
Types: deb
URIs: http://download.proxmox.com/debian/pve
Suites: trixie
Components: pve-no-subscription
Signed-By: /usr/share/keyrings/proxmox-archive-keyring.gpg
```

### Update and Upgrade

```bash
apt update && apt full-upgrade
```

## Done!
