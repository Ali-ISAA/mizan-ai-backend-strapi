#!/bin/bash
set -e

# Check if package.json exists, if not, initialize Strapi
if [ ! -f "package.json" ]; then
  echo "Initializing Strapi project..."
  npx create-strapi-app@latest . --quickstart --no-run
  echo "Strapi project initialized successfully!"
else
  echo "Strapi project already exists, skipping initialization..."
fi

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install
fi

# Build the admin panel
echo "Building Strapi..."
npm run build

# Start Strapi in development mode
echo "Starting Strapi in development mode..."
exec npm run develop
