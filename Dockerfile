FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npx gatsby clean

# GATSBY_EXPERIMENTAL_PAGE_BUILD_ON_DATA_CHANGES 和 DEV_SSR 都不管用
# 用 GATSBY_CPU_COUNT 限制并发，同时关闭 SSR bundle 检查
ENV GATSBY_EXPERIMENTAL_DISABLE_SSR_DURING_BUILD=true

RUN npx gatsby build
