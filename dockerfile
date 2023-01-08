
FROM node:alpine

WORKDIR /src/app

COPY package*.json ./

RUN npm install

EXPOSE 3333

COPY . .
CMD npm start