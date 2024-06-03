# My commands dump
---

## Contents
- [Scripts](#scripts) 
  - [Run remote script using domain](#run-remote-script-using-domain) 
  - [Auto Commit to Github](#auto-commit) 
- [Configurations](#configs) 
  - [Git Configuration](#git-configuration) 
  - [Wifi 5g Fix](#wifi-5g-fix) 
  - [Media Server Docker-Compose setup](#docker-compose)
    - [On Linux](#linux) 
    - [On Windows](#windows)  


# Scripts
---
Collection of scripts

## Run remote script using domain

automatically execute scripts from github in one line

```
bash <(curl -sSL https://website-1lt.pages.dev/fastfetch)

```
# Auto commit
---
This script automatically checks and commits changes to main branch on github in one command 

- ### usage:
```
commit.sh -m "Commit message"
```
- ### Code
```
#!/bin/bash

# Check if there are changes to commit
if [ -n "$(git status --porcelain)" ]; then
    # Add all changes
    git add .

    # Prompt for commit message
    read -p "Enter commit message: " commit_message

    # Commit changes
    git commit -m "$commit_message"

    # Push changes to origin main
    git push origin main

    echo "Changes committed and pushed successfully."
else
    echo "No changes to commit."
fi

```


# Configs
---

## Git Configuration

To set up your Git configurations, use the following commands:

```bash
git config --global user.name "excreal1"
git config --global user.email "148652451+excreal1@users.noreply.github.com"
git config --global credential.helper store

```

## Wifi 5g Fix

These are various commands to connect to 5G

```
iwlist wlo1 freq
sudo iwconfig wlo1 freq 5.7G

or 

nmcli device wifi rescan
nmcli device wifi list
nmcli device wifi connect 78:45:58:78:2F:C3
nmcli connection modify UoNWIFI 802-11-wireless.band "a"

```

# Docker Compose
---

Media server docker setup configuration

- ## Linux 
```
version: "2.1"
services:

  radarr:
    image: linuxserver/radarr
    container_name: radarra
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
      - UMASK_SET=022 #optional
    volumes:
      - /home/media/configs/Radarr:/config
      - /home/media/downloads:/downloads
      - /home/media/movies:/Movies
    ports:
      - 7878:7878
    restart: unless-stopped
    
  sonarr:
    image: linuxserver/sonarr
    container_name: sonarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
      - UMASK_SET=022
    volumes:
      - /home/media/configs/Sonarr:/config
      - /home/media/downloads:/downloads
      - /home/media/tv:/tv
    ports:
      - 8989:8989
    restart: unless-stopped

  qbittorrent:
    image: ghcr.io/linuxserver/qbittorrent
    container_name: qbittorrent
    ports:
      - "8080:8080"
      - "6881:6881"
      - "6881:6881/udp"
    environment:
      - PUID=1000
      - PGID=1000

    volumes:
      - /home/media/configs/qbittorrent:/config
      - /home/media/downloads:/downloads
    restart: unless-stopped

  prowlarr:
    image: lscr.io/linuxserver/prowlarr:latest
    container_name: prowlarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/media/configs/prowlarr/:/config
    ports:
      - 9696:9696
    restart: unless-stopped

  jellyfin:
    image: lscr.io/linuxserver/jellyfin:latest
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/media/configs/jellyfin:/config
      - /home/media/:/media
    ports:
      - 8096:8096
    restart: unless-stopped

  homarr:
    container_name: homarr
    image: ghcr.io/ajnart/homarr:latest
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # Optional, only if you want docker integration
      - ./homarr/configs:/app/data/configs
      - ./homarr/icons:/app/public/icons
      - ./homarr/data:/data
    ports:
      - '7575:7575'
  jellyseerr:
    container_name: jellyseerr
    image: ghcr.io/hotio/jellyseerr
    ports:
      - "5055:5055"
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Etc/UTC
    volumes:
      - /home/media/configs/jellyseerr:/config
  plex:
    image: lscr.io/linuxserver/plex:latest
    container_name: plex
    network_mode: host
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - VERSION=docker
      - PLEX_CLAIM= #optional
    volumes:
      - /home/media/configs/plex:/config
      - /home/media/tv:/tv
      - /home/media/movies:/movies
      - /home/media/music:/music
    ports:
      - "32400:32400/tcp"
    restart: unless-stopped
  lidarr:
    image: lscr.io/linuxserver/lidarr:latest
    container_name: lidarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - /home/media/configs/lidarr:/config
      - /home/media/music:/music #optional
      - /home/media/downloads:/downloads #optional
    ports:
      - 8686:8686
    restart: unless-stopped
    
  apache:
    image: httpd:latest
    ports:
      - "80:80"
    volumes:
      - /home/media:/usr/local/apache2/htdocs
    restart: always
    command: ["sh", "-c", "sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                        sed -i '/LoadModule ssl_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                        sed -i '/LoadModule socache_shmcb_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                        echo 'AcceptPathInfo on' >> /usr/local/apache2/conf/httpd.conf && \
                        httpd-foreground"]
``` 

- ## Windows 

```
version: "2.1"
services:

  radarr:
    image: linuxserver/radarr
    container_name: radarra
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
      - UMASK_SET=022 #optional
    volumes:
      - E:\media\configs\Radarr:/config
      - E:\media\downloads:/downloads
      - E:\media\movies:/Movies
    ports:
      - 7878:7878
    restart: unless-stopped
    
  sonarr:
    image: linuxserver/sonarr
    container_name: sonarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Los_Angeles
      - UMASK_SET=022
    volumes:
      - E:\media\configs\Sonarr:/config
      - E:\media\downloads:/downloads
      - E:\media\tv:/tv
    ports:
      - 8989:8989
    restart: unless-stopped

  qbittorrent:
    image: ghcr.io/linuxserver/qbittorrent
    container_name: qbittorrent
    ports:
      - "8080:8080"
      - "6881:6881"
      - "6881:6881/udp"
    environment:
      - PUID=1000
      - PGID=1000

    volumes:
      - E:\media\configs\qbittorrent:/config
      - E:\media\downloads:/downloads
    restart: unless-stopped

  prowlarr:
    image: lscr.io/linuxserver/prowlarr:latest
    container_name: prowlarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - E:\media\configs\prowlarr:/config
    ports:
      - 9696:9696
    restart: unless-stopped

  jellyfin:
    image: lscr.io/linuxserver/jellyfin:latest
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - E:\media\configs\jellyfin:/config
      - E:\media:/media
    ports:
      - 8096:8096
    restart: unless-stopped

  homarr:
    container_name: homarr
    image: ghcr.io/ajnart/homarr:latest
    restart: unless-stopped
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # Optional, only if you want docker integration
      - ./homarr/configs:/app/data/configs
      - ./homarr/icons:/app/public/icons
      - ./homarr/data:/data
    ports:
      - '7575:7575'
  jellyseerr:
    container_name: jellyseerr
    image: ghcr.io/hotio/jellyseerr
    ports:
      - "5055:5055"
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Etc/UTC
    volumes:
      - E:\media\configs/jellyseerr:/config
  plex:
    image: lscr.io/linuxserver/plex:latest
    container_name: plex
    network_mode: host
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      - VERSION=docker
      - PLEX_CLAIM= #optional
    volumes:
      - E:\media\configs\plex:/config
      - E:\media:/media

    ports:
      - "32400:32400/tcp"
    restart: unless-stopped
  lidarr:
    image: lscr.io/linuxserver/lidarr:latest
    container_name: lidarr
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - E:\media\configs/lidarr:/config
      - E:\media\music:/music #optional
      - E:\media\downloads:/downloads #optional
    ports:
      - 8686:8686
    restart: unless-stopped
    
  apache:
    image: httpd:latest
    ports:
      - "80:80"
    volumes:
      - /home/media:/usr/local/apache2/htdocs
    restart: always
    command: ["sh", "-c", "sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                        sed -i '/LoadModule ssl_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                        sed -i '/LoadModule socache_shmcb_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
                        echo 'AcceptPathInfo on' >> /usr/local/apache2/conf/httpd.conf && \
                        httpd-foreground"]

```

