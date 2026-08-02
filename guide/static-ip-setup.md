# How to set up a static IP on a debian machine

The process is actually really simple, just set it to static on the networking interface.


## /etc/networking/interfaces

Update the `/etc/network/interfaces` file to show as the following:

```bash
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

# The primary network interface
allow-hotplug ens18
iface ens18 inet static  # This is where you make the change
    address 192.168.0.71/24
	gateway 192.168.0.1
	dns-nameservers 1.1.1.1 8.8.8.8
```

```bash
systemctl restart networking
```

## Breakdown of the change

Remove `dhcp`and add `static` to the `iface` line and add the address, gateway, and dns-nameservers

address: This is the static address for the machine
gateway: This is the address for the router itself
dns-nameservers: This is the ip address for the DNS resolution

