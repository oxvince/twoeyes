FROM --platform=linux/amd64 node:14-bullseye AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npx gatsby build
