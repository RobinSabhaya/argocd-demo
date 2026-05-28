FROM node:22-alpine AS base

WORKDIR /app

# Install deps
FROM base AS deps

COPY package*.json .

RUN npm install --omit=dev

# Source stage
FROM base AS src

COPY src src

# Runner stage
FROM node:22-alpine AS runner

COPY --from=src /app/src ./ 
COPY --from=deps /app/package*.json ./
COPY --from=deps /app/node_modules ./node_modules

ENV PORT=3000

EXPOSE 3000

CMD [ "npm", "start" ]