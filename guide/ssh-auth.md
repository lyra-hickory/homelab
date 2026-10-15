# Using SSH keys for auth

### Terminology

Host: The machine you are SSH'ing *into*

Client: The machine you are SSH'ing *from*

## How To

1. First we want to set up the key used for authenticating:

From the *Client* we want to generate the key

```
ssh-keygen -t ed25519 -C user@client
```

Note: I suggest using the identifier user@client as email in order to recognize which keys are which

2. Add the pub key to the *Host* `authorized_keys`

```
# Host
cat client_key.pub >> ~/.ssh/authorized_keys
```

You can scp the `client_key.pub` over to the Host

3. Optional: add an identity for the Host to the Client's config

On `Host:~/.ssh/config` you can add the following config

```
Host name_for_our_host
    HostName ip-to-host
    IdentityFile client_key
    User user
```

Note: you need to use the private key here

An example:

```
Host dbe02
    HostName 192.168.0.72
    IdentityFile dbe02
    User lyra
```

This allows you to simply do an `ssh dbe02`
