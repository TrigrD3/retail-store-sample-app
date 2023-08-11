#!/bin/bash

# Update package repositories
sudo apt update -y

# Install Docker using Snap
sudo snap install docker

# Set up Docker Compose as a CLI plugin
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

# Switch to the 'ubuntu' user and execute the following commands
su - ubuntu -c '
    # Create a new group named 'docker'
    sudo groupadd docker

    # Add the current user to the 'docker' group
    sudo usermod -aG docker $USER

    # Clone the Git repository
    git clone https://github.com/aws-containers/retail-store-sample-app.git

    # Navigate to the application directory
    cd retail-store-sample-app/dist/docker-compose

    # Start the application using Docker Compose
    sudo MYSQL_PASSWORD="root" docker compose up
'
