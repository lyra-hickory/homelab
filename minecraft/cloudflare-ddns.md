# Overview

A quick overview of the DDNS setup.

## cloudflare-ddns

I opted to run the ddns daemon in a docker compose:

```
/opt/cloudflare-ddns/docker-compose.yml
```

Config:

```
services:
  cloudflare-ddns:
    image: favonia/cloudflare-ddns:latest
    network_mode: host
    restart: always
    user: "1000:1000"
    environment:
      - CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}
      - DOMAINS=play.puppy-den.xyz
      - PROXIED=false
      - UPDATE_CRON=@every 5m
      - IP6_PROVIDER=none
```

Also add the `.env` file with the `CLOUDFLARE_API_TOKEN` in the same folder

```
docker compose up -d
```

That's it! Check if it ran:

```
docker compose logs
```

Should auto start on boot now as well
