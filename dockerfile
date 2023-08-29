# syntax=docker/dockerfile:1.4

# Create image based on the official Node image from dockerhub
FROM node:node:18-alpine AS development

# Create app directory
RUN apk add --no-cache libc6-compat
WORKDIR /app
ENV NODE_ENV=production
# Copy dependency definitions
COPY package.json /usr/src/app
COPY package-lock.json /usr/src/app

# Install dependecies
#RUN npm set progress=false \
#    && npm config set depth 0 \
#    && npm i install
RUN npm install --production
RUN npm run build

# Get all the code needed to run the app
COPY . /app

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["turbo", "build lint", "dev"]

FROM development as dev-envs
RUN <<EOF
apt-get update
apt-get install -y --no-install-recommends git
EOF

RUN <<EOF
useradd -s /bin/bash -m vscode
groupadd docker
usermod -aG docker vscode
EOF
# install Docker tools (cli, buildx, compose)
COPY --from=gloursdocker/docker / /
CMD ["npm", "start"]