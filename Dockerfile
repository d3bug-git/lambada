FROM node:18-alpine
WORKDIR /lambada 
COPY . .
RUN npm install -g pnpm && \
    pnpm install
CMD [ "pnpm","--parallel","--filter","@lambada/*","run","dev" ]
EXPOSE 3000
EXPOSE 3333