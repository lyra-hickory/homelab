# How to set up a new machine from a clone

This quick guide is assuming the new machine is a clone of dbe, and the aim is to quickly set up a new machine without clashing ssh and machine-id.

## Step by step

1. Hostname updates

First set it via hostnamectl, this sets it in `/etc/hostname`

```bash
hostnamectl set-hostname dbe0x
```


Next update the hosts

```bash
vim /etc/hosts
```

Set the output to something like this:

```bash

127.0.0.1	localhost
127.0.1.1	dbe0x.home.arpa	dbe0x

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

2. Machine ID reset

Second we want to update the machine id to something unique

```bash
rm /etc/machine-id
```

Also remove legacy copy

```bash
rm /var/lib/dbus/machine-id
```

Now we want to generate the new machine id

```bash
systemd-machine-id-setup
```

3. SSH reset

Lastly we want to reset our ssh keys

```bash
rm /etc/ssh/ssh_host_*
```

And finally we regen it with

```bash
ssh-keygen -A
```

4. Reboot time

```bash
reboot
```

## Done!

Now we have a new machine spun up from a copy of a fresh dbe installation.
