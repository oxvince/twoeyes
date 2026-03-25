FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app
COPY package*.json ./
RUN npm install && npx update-browserslist-db@latest
COPY . .
RUN npx gatsby clean && npx gatsby build
