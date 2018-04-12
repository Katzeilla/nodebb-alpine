FROM node:alpine

COPY scripts/entrypoint.sh /entrypoint.sh
COPY scripts/setup.sh /setup.sh
COPY scripts/start.sh /start.sh

RUN apk add --no-cache \
		git \
		bash

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 4567

