# -------------------------
# 1. Use official Node.js base image
# -------------------------
FROM node:18-alpine

# -------------------------
# 2. Set working directory inside container
# -------------------------
WORKDIR /app

# -------------------------
# 3. Copy package files and install dependencies
# -------------------------
COPY package*.json ./
RUN npm install --only=production

# -------------------------
# 4. Copy all source code
# -------------------------
COPY . .

# -------------------------
# 5. Expose the app port
# -------------------------
EXPOSE 3000

# -------------------------
# 6. Define environment variables (optional)
# -------------------------
# These can also be overridden in your CI/CD or docker-compose.yml
ENV PORT=3000
ENV NODE_ENV=production

# -------------------------
# 7. Start the server
# -------------------------
CMD ["node", "server.js"]
