# Overview

So a quick overview, this is the setup for managing the systemd process

## Management commands reference

Start / Stop

```
systemctl start minecraft
```

```
systemctl stop minecraft
```

Actively logs the output

```
journalctl -u minecraft -f
```

Reloads the daemon

```
systemctl daemon-reload
```

Symlink

```
systemctl enable minecraft
```

## Config

Here is the service config:

```
# /etc/systemd/system/minecraft.service
[Unit]
Description=Paper Minecraft Server
After=network.target

[Service]
User=minecraft
Group=minecraft
WorkingDirectory=/opt/minecraft/public-vanilla/
ExecStart=/usr/bin/java -Xms2G -Xmx4G -jar paper.jar nogui
ExecStop=/bin/kill -SIGINT $MAINPID
Restart=on-failure
RestartSec=10
SyslogIdentifier=minecraft

[Install]
WantedBy=multi-user.target
```
