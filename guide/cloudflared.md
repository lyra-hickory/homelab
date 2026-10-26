# Cloudflare: cloudflared

A quick guide on my cloudflared setup:

1. Make a new folder in `/opt/cloudflared`

2. Docker compose file:
```
# docker-compose.yml
services:
  cloudflared:
    image: cloudflare/cloudflared:latest
    container_name: cloudflared
    restart: unless-stopped
    command: tunnel --no-autoupdate run
    env_file:
      - .env
    networks:
      - cloudflared_net

networks:
  cloudflared_net:
    driver: bridge
```

3. Add `.env` with the tunnel token, e.g.

```
# .env
TUNNEL_TOKEN=stub_token
```

4. Run with `docker compose up`

## Update process:

`cd /opt/cloudflared`

`docker compose pull`

`docker compose up -d`

`docker exec cloudflared cloudflared --version`

`docker logs cloudflared --tail 20`

