# caddyflare

[![Build and Push](https://github.com/yashjawale/caddyflare/actions/workflows/build.yml/badge.svg)](https://github.com/yashjawale/caddyflare/actions/workflows/build.yml)
[![Monitor Upstream Caddy](https://github.com/yashjawale/caddyflare/actions/workflows/monitor.yml/badge.svg)](https://github.com/yashjawale/caddyflare/actions/workflows/monitor.yml)


Automated Docker builds of Caddy with the Cloudflare DNS module pre-compiled. Monitors the upstream Caddy releases and automatically builds new images whenever a new version is available.

If `dns.providers.cloudflare` becomes standard on Caddy installations this build won't be needed.

- Automated builds on upstream Caddy releases
- Weekly monitoring of Caddy repository for updates
- Pre-compiled Cloudflare DNS module included
- Published to GitHub Container Registry (GHCR)

## Quick Start

### Pull from GHCR

```bash
docker pull ghcr.io/yashjawale/caddyflare:latest
```

Or pull a specific version:

```bash
docker pull ghcr.io/yashjawale/caddyflare:v2.7.6
```

### Run Container

```bash
docker run -d \
  --name caddyflare \
  -p 80:80 \
  -p 443:443 \
  -v /path/to/Caddyfile:/etc/caddy/Caddyfile \
  -v caddydata:/data \
  ghcr.io/yashjawale/caddyflare:latest
```

## Build Locally

Docker with BuildKit support is required.

```bash
docker build -t caddyflare:latest --build-arg REPO_NAME=yashjawale/caddyflare .
```

## Modules Included

- **Cloudflare DNS**: `github.com/caddy-dns/cloudflare` - Enables DNS-01 ACME challenges via Cloudflare

## Configuration

Use this image just like the standard Caddy image. Provide your `Caddyfile` and enjoy the Cloudflare DNS module out of the box.

Example `Caddyfile`:

```
example.com {
  tls {
    dns cloudflare {env.CLOUDFLARE_API_TOKEN}
  }
  respond "Hello, world!"
}
```

## Environment Variables

When using Cloudflare DNS for ACME challenges, set:

- `CLOUDFLARE_API_TOKEN` - Your Cloudflare API token

Example:

```bash
docker run -e CLOUDFLARE_API_TOKEN=your_token_here ghcr.io/yashjawale/caddyflare:latest
```

## Credits
- https://github.com/caddyserver/caddy
- https://github.com/caddy-dns/cloudflare

---

<a href="https://yashjawale.github.io/" target="_blank"><img style="height: 22px;" src="https://raw.githubusercontent.com/yashjawale/.github/main/docs/logo.svg" alt="Yash Jawale"/></a>