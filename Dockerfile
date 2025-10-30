FROM node:20-alpine

# Installing libvips-dev for sharp compatibility and bash
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/app

# Install node-gyp globally
RUN npm install -g node-gyp

# Configure npm
RUN npm config set fetch-retry-maxtimeout 600000 -g

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Change ownership to node user
RUN chown -R node:node /opt/app

# Switch to node user
USER node

EXPOSE 1337

# Use entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
