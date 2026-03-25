FROM --platform=linux/amd64 node:14-bullseye

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# 修复 .browserslistrc
RUN node -e "const fs = require('fs'); const content = fs.readFileSync('.browserslistrc', 'utf8'); console.log('原内容:', content); const fixed = content.split('\n').filter(function(line){ return !line.includes('not supports es6-module'); }).join('\n'); fs.writeFileSync('.browserslistrc', fixed); console.log('修复后:', fs.readFileSync('.browserslistrc', 'utf8'));"

ENV GATSBY_EXPERIMENTAL_DISABLE_SSR_DURING_BUILD=true

RUN npx gatsby clean && npx gatsby build
