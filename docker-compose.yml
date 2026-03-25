FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
COPY Seo.patched.tsx src/components/Seo/Seo.tsx
RUN npx gatsby clean && npx gatsby build

CMD ["sh", "-c", "cp -r /app/public/. /output/"]
