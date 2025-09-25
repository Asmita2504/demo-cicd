#!/bin/bash
set -e

echo "🔐 Logging into Docker Registry..."
docker login -u "$DOCKERHUB_USERNAME" -p "$DOCKERHUB_PASSWORD" "$REGISTRY_URL"

echo "📦 Pulling latest image..."
docker pull "$IMAGE_NAME"

echo "🧼 Stopping and removing old container if it exists..."
docker stop demo || true
docker rm demo || true

echo "🚀 Starting new container..."
docker run -d --restart unless-stopped \
  --env-file /home/$USER/.env.prod \
  -p 8080:8080 \
  --name demo \
  "$IMAGE_NAME"

echo "✅ Deployment complete."
