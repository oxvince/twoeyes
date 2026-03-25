FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app
COPY package*.json ./
RUN npm install
# 强制升级 gatsby 到修复了此 bug 的最后一个 v3 版本
RUN npm install gatsby@3.15.0 --save
COPY . .
RUN npx gatsby clean && npx gatsby build
