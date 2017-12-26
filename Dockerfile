FROM node:alpine

USER node

ENV NODE_ENV=production \
    daemon=false \
    silent=false

CMD if [[ -d /home/node/nodebb ]]; then cd /home/node/nodebb && ./nodebb ; fi

WORKDIR /home/node/nodebb

EXPOSE 4567

