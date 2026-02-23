FROM caddy:builder AS builder

RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Get source from GitHub repository
ARG REPO_NAME
LABEL org.opencontainers.image.source=https://github.com/${REPO_NAME}
