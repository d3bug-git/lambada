ARG NODE_IMAGE=node:18-alpine

FROM $NODE_IMAGE AS base
RUN apk --no-cache add dumb-init &&\
    npm install -g pnpm
RUN mkdir -p /home/node/lambada && chown node:node /home/node/lambada &&\
    mkdir -p /home/node/lambada/apps/api && chown node:node /home/node/lambada/apps/api &&\
    mkdir -p /home/node/lambada/apps/frontend && chown node:node /home/node/lambada/apps/frontend
WORKDIR /home/node/lambada
USER node

FROM base AS dependencies
COPY --chown=node:node ./.npmrc* ./pnpm-workspace*.yaml ./pnpm-lock*.yaml ./
COPY --chown=node:node ./apps/api/package*.json ./apps/api/
COPY --chown=node:node ./apps/frontend/package*.json ./apps/frontend/
RUN pnpm install
COPY --chown=node:node . .

