#!/bin/bash

Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. UMBWA. run sudo su first, then try again." 
    exit 1
fi

# Add the current user to the docker group
 apt update &&  apt install docker docker-compose
 usermod -aG docker $USER

# Create a directory for Nginx Proxy Manager
 mkdir /opt/nginx-proxy-manager

# Create a Docker Compose file
 cat <<EOT >> /opt/nginx-proxy-manager/docker-compose.yml
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOT

# Change permissions for the Docker Compose file
mkdir -p /opt/nginx-proxy-manager/data
mkdir -p /opt/nginx-proxy-manager/letsencrypt
chown -R 101:101 /opt/nginx-proxy-manager/data
chown -R 101:101 /opt/nginx-proxy-manager/letsencrypt

chmod 777 /opt/*
chmod 777 /opt/nginx-proxy-manager/docker-compose.yml

# Start Nginx Proxy Manager
cd /opt/nginx-proxy-manager
docker-compose up -d

# Add Plex repository key
curl https://downloads.plex.tv/plex-keys/PlexSign.key | apt-key add -

# Add Plex repository
echo deb https://downloads.plex.tv/repo/deb public main | tee /etc/apt/sources.list.d/plexmediaserver.list

# Update package lists
apt update

# Install Plex Media Server
apt install -y plexmediaserver

# Start Plex Media Server
systemctl start plexmediaserver

# Enable Plex Media Server to start on boot
systemctl enable plexmediaserver

# Display Plex Media Server status
systemctl status plexmediaserver


exit

