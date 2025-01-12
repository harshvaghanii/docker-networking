#!/bin/bash

#Remove the image if exists to rebuild it
docker rmi starwars-api || { echo "No Image with the name starwars-api exists, creating a new one..."; }

# Build a Docker image
docker build -t starwars-api .

# Deleting the container if exists
docker stop starwars || { echo "No container with the name starwars exists, creating a new one..."; }

# Run a Docker container
docker run -d -p 3000:3000 --name starwars --rm --network starwars starwars-api