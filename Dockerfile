FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app

COPY package*.json ./
COPY patches ./patches

# 安装依赖，用 unsafe-perm 解决 postinstall 权限问题
RUN npm install --unsafe-perm

# 再次确保补丁打上（双重保险）
RUN npx patch-package

COPY . .
COPY Seo.patched.tsx src/components/Seo/Seo.tsx

RUN npx gatsby clean && npx gatsby build

CMD ["sh", "-c", "cp -r /app/public/. /output/"]
