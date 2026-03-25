FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# 用 patch 文件覆盖有 bug 的 Seo.tsx
COPY Seo.patched.tsx src/components/Seo/Seo.tsx

RUN npx gatsby clean && npx gatsby build
