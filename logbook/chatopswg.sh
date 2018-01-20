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
