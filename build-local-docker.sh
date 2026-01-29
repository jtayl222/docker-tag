#!/bin/bash
set -e

# Get the git commit SHA
GIT_COMMIT_SHA=$(git rev-parse HEAD)
SHORT_SHA=$(git rev-parse --short HEAD)

echo "Building Docker image with commit SHA: $GIT_COMMIT_SHA"

# Build the Docker image with the git commit SHA as both a build arg and tag
docker build \
    --build-arg GIT_COMMIT_SHA="$GIT_COMMIT_SHA" \
    -t gitcommitapp:"$SHORT_SHA" \
    -t gitcommitapp:latest \
    .

echo ""
echo "Successfully built:"
echo "  - gitcommitapp:$SHORT_SHA"
echo "  - gitcommitapp:latest"
echo ""
echo "Run with: docker run gitcommitapp:$SHORT_SHA"
