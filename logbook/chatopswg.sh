# chatopswg - 45.55.32.60 - DigitalOcean NYC3
# Ubuntu 16.04.3 LTS
#
# VM pre-installed with my public key

# ssh root@45.55.32.60
# ssh root@chatopswg.alligo.com.br
# mosh root@chatopswg.alligo.com.br

sudo apt update
sudo apt upgrade -y

sudo apt install htop tree jq mosh -y # Not really necessary, but I, Rocha, like it on host VM

### Swap & Casse pressure on Ubuntu 16.04
## See https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04
# Note: is a good idea setup some swap for peak memory usage, but is not cool
#       with the hardware provider rely reavily on swap with SSH disks, because
#       SSD have much more limited lifetime writes than HDD. Play nice.
fallocate -l 2G /swapfile
ls -lh /swapfile
chmod 600 /swapfile
ls -lh /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show

# Make permanent
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Swapness
sysctl vm.swappiness=10
vim /etc/sysctl.conf
## Add at the end
# vm.swappiness=10

## Adjusting the Cache Pressure Setting
sysctl vm.vfs_cache_pressure=50
vim /etc/sysctl.conf
## Add at the end
# vm.vfs_cache_pressure=50

### Unattended updates on Ubuntu Server, only security updates
## Is possible that your distro provider already have at least security updates enabled
## If not, review it
## See https://www.techrepublic.com/article/how-to-enable-unattended-updates-on-ubuntu-server-16-04/
apt install unattended-upgrades

vim /etc/apt/apt.conf.d/50unattended-upgrades
## The like `"${distro_id}:${distro_codename}-security";` is about security updates. Possibly already uncommented
## The line `"${distro_id}:${distro_codename}-updates";` is for other updates (not only security). Uncommented

############################# **Security warning** #############################
# This VM is designed for testing and be friendly even for who is new to docker
# at least start project without care much about running docker on production.
# And the lifetime of this VM will be less than 6 months. And, by other factors
# than just security, will have some regular backups or easy to be regenerated.
# This explain why docker will be running as root, which is less secure, because
# is faster to avoid extra steps and a a lot of time-consuming debugging. PRs
# and issues on GitHub page are wellcome, in special if some configuration
# on this infrastructure could easily exploited by automated tools, but just
# consider that some even less secure use on the containers, like explicit open
# ports or admin panels, are not just because is a testing envoriment, but
# to make it more frienly to non devops people.
#
# For running docker on production or with more sensive data, consider
# this documentation at https://docs.docker.com/engine/security/security/
############################# **Security warning** #############################

### Install docker on ubuntu
# See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
# See (in Portuguese) https://www.digitalocean.com/community/tutorials/como-instalar-e-usar-o-docker-no-ubuntu-16-04-pt

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-get install -y docker-engine

### Install Docker compose
# See https://docs.docker.com/compose/install/#install-compose

# change X.XX.X based on last release of https://github.com/docker/compose/releases
dockerComposeVersion=1.18.0

sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

## Prepare place to store docker-compose files of containers
mkdir /root/containers

################################################################################
# Cheat cheet to manage containers                                             #
################################################################################

cd /root/containers # all commands are relative to this path

## First time: need to start containers who create a network before traefik
## it will not complain about network not found (rocketchat,other... then traefik)

## Traefik
# See https://traefik.io/
# "Træfik (pronounced like traffic) is a modern HTTP reverse proxy and load 
# balancer made to deploy microservices with ease. It supports several
# backends (...) to manage its configuration automatically and dynamically."

docker-compose -f ./traefik/docker-compose.yml up -d traefik # Start
docker-compose -f ./traefik/docker-compose.yml up traefik # Start, debug mode
docker-compose -f ./traefik/docker-compose.yml stop traefik # Stop

# see logs
docker logs -f traefik_traefik_1

# To copy acme from a old backup:
# scp -r /backup/chatopswg/alpha.chatopswg.xyz/temp/traefik/acme/acme.json root@alpha.chatopswg.xyz:/root/containers/traefik/acme/acme.json

### Portainer
docker-compose -f ./portainer/docker-compose.yml up -d
docker-compose -f ./portainer/docker-compose.yml up --build -d proxy  # If make changes to portainer-proxy (nginx), use this to rebuild it

# See logs
docker logs -f portainer-proxy

### Rocket.Chat
# "Rocket.Chat is the leading free open source team chat Slack alternative (...)
# Rocket.Chat is free, unlimited and open source. Replace Slack with the
# ultimate team chat software solution. Free audio and video conferencing,
# guest access, screen sharing, file sharing, LiveChat, LDAP Group Sync,
# two-factor authentication (2FA), E2E encryption, SSO, dozens of OAuth
# providers and unlimited Users, Guests, Channels, Messages, Searches, Files"

docker-compose -f ./rocketchat/docker-compose.yml up -d mongo
docker-compose -f ./rocketchat/docker-compose.yml up -d mongo-init-replica  # Only first time
docker-compose -f ./rocketchat/docker-compose.yml up -d rocketchat
docker-compose -f ./rocketchat/docker-compose.yml up -d hubot

## Update
# Pull images & update rocket.chat
docker-compose -f rocketchat/docker-compose.yml pull
# Recreate images if need. mongo container will update as dependency of rocketchat
docker-compose -f ./rocketchat/docker-compose.yml up -d rocketchat

### Placeholder for static files
docker-compose -f ./placeholder/docker-compose.yml up -d nginx
docker-compose -f ./placeholder/docker-compose.yml up nginx # Debug

### ia-php-botman
# See https://github.com/fititnt/chatops-wg-ia-php-botman
# Hotfix form permissions
# `chmod 777 -R /root/containers/ia-php-botman/``

docker-compose -f ./ia-php-botman/docker-compose.yml up -d
docker-compose -f ./ia-php-botman/docker-compose.yml up # Debug only

### ia-js-botkit
# See https://github.com/fititnt/chatops-wg-ia-js-botkit

docker-compose -f ./ia-js-botkit/docker-compose.yml up -d
docker-compose -f ./ia-js-botkit/docker-compose.yml up # Debug only