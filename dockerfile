FROM node:18-alpine
RUN npm install -g pnpm
WORKDIR /lambada 
COPY . .
CMD [ "tail","-f","/dev/null" ]
EXPOSE 3000