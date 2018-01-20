# chatopswg - 45.55.32.60 - DigitalOcean NYC3
# Ubuntu 16.04.3 LTS
#
# VM pre-installed with my public key

# ssh root@45.55.32.60
# ssh root@chatopswg.alligo.com.br
## Recomended:
# ssh ubuntu@chatopswg.alligo.com.br

sudo apt update
sudo apt upgrade -y

sudo apt install htop tree jq -y # Not really necessary, but I, Rocha, like it on host VM

### Initial serversetup
## See https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

# Add user 'ubuntu' with sudo powers
adduser ubuntu
usermod -aG sudo ubuntu

sudo su ubuntu # log as ubuntu user
cd ~

# Generate keygen, as ubuntu user
ssh-keygen

vim /home/ubuntu/.ssh/authorized_keys # then paste your public key from **local* machine, e.g. `cat ~/.ssh/id_rsa.pub` on this file
chmod 600 /home/ubuntu/.ssh/authorized_keys
exit # exited to root
exit # exited from VM

# Now log as non-root user
ssh ubuntu@chatopswg.alligo.com.br

## Install docker on ubuntu
# See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
# See (in Portuguese) https://www.digitalocean.com/community/tutorials/como-instalar-e-usar-o-docker-no-ubuntu-16-04-pt