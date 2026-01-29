#!/bin/bash
set -e

# Get the git commit SHA (from parent repo)
GIT_COMMIT_SHA=$(git -C .. rev-parse HEAD)
SHORT_SHA=$(git -C .. rev-parse --short HEAD)

echo "Building Docker image with commit SHA: $GIT_COMMIT_SHA"

# Build the Docker image with the git commit SHA as both a build arg and tag
docker build \
    --build-arg GIT_COMMIT_SHA="$GIT_COMMIT_SHA" \
    -t gitcommitapp-cpp:"$SHORT_SHA" \
    -t gitcommitapp-cpp:latest \
    .

echo ""
echo "Successfully built:"
echo "  - gitcommitapp-cpp:$SHORT_SHA"
echo "  - gitcommitapp-cpp:latest"
echo ""
echo "Run with: docker run gitcommitapp-cpp:$SHORT_SHA"
