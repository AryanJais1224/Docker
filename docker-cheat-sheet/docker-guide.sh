#!/bin/bash

# --- IMAGE COMMANDS ---
docker build -t app:v1 .                 # Build an image from a Dockerfile
docker images                            # List all local images
docker rmi <image_id>                    # Remove a specific image
docker tag app:v1 repo/app:v1            # Retag an image for a registry
docker push repo/app:v1                  # Upload image to a repository
docker pull python:3.9-slim              # Download image from Docker Hub
docker image prune -a                    # Delete all unused images

# --- CONTAINER LIFECYCLE ---
docker run -d --name my-app app:v1       # Run container in background (detached)
docker run -p 8080:3000 app:v1           # Run with host:container port mapping
docker ps                                # List running containers
docker ps -a                             # List all containers (including stopped)
docker stop <container_id>               # Stop a running container
docker start <container_id>              # Start a stopped container
docker rm -f <container_id>              # Force remove a running container

# --- DEBUGGING & INTERACTION ---
docker logs -f <container_id>            # Follow live container logs
docker exec -it <container_id> sh        # Open interactive shell in container
docker inspect <container_id>            # View low-level JSON configuration
docker stats                             # Show real-time CPU/RAM usage
docker top <container_id>                # Display processes inside container
docker cp <file> <container_id>:/path    # Copy files into a container

# --- VOLUME & NETWORK ---
docker volume ls                         # List all persistent volumes
docker volume create my-data             # Create a named storage volume
docker network ls                        # List all Docker networks
docker network inspect bridge            # View details of the bridge network

# --- DOCKER COMPOSE ---
docker-compose up -d                     # Start multi-container stack in background
docker-compose down                      # Stop and remove the entire stack
docker-compose logs -f                   # View aggregated logs for all services
docker-compose build --no-cache          # Rebuild images from scratch
docker-compose ps                        # List status of stack services

# --- SYSTEM CLEANUP ---
docker system prune -f                   # Remove all unused data (containers/networks)
docker system df                         # Show Docker disk usage summary
