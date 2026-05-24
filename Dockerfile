# Made by Skyler Blue Spillers - Innovative Information Technology Resolutions LLC
# SKY4444 Money Management App - Production Dockerfile

FROM node:22-alpine AS builder
WORKDIR /app

# Install dependencies first (layer caching)
COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm install --frozen-lockfile

# Copy source and build
COPY . .
RUN pnpm build

# Production stage - minimal image
FROM node:22-alpine AS production
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

# Copy only what's needed for production
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./

# Security: run as non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S appuser -u 1001 -G nodejs
USER appuser

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/api/health || exit 1

EXPOSE 3000

CMD ["node", "dist/index.js"]
