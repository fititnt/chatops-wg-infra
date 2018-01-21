#!/bin/bash
#===============================================================================
#
#          FILE:  backup-rocketchat.sh
#
#         USAGE:  ./backup-alpha.chatopswg.xyz.sh
#
#   DESCRIPTION:  Backup alpha server (mongodb and dockerfiles configuration).
#                 Stop MongoDB and Rocket.Chat, rsync cadu with local folder,
#                 then start MongoDB and Rocket.Chat.
#
#
#       OPTIONS:  ---
#  REQUIREMENTS:  Requires passwordless `ssh root@alpha.chatopswg.xyz`.
#                 Requires `mkdir -p /backup/chatopswg/alpha.chatopswg.xyz/`
#                 1st time
#          BUGS:  ---
#         NOTES:  TODO: convert to make backup without stoping the services
#        AUTHOR:  Emerson Rocha <emerson@alligo.com.br>
#       COMPANY:  Alligo
#       VERSION:  1.0
#       CREATED:  2018-01-21 12:05:00 BRT
#      REVISION:  ---
#===============================================================================

echo "Stoping mongo and rocketchat"
ssh root@alpha.chatopswg.xyz "cd /root/containers; docker-compose -f ./rocketchat/docker-compose.yml stop rocketchat; docker-compose -f ./rocketchat/docker-compose.yml stop mongo"

echo "rsync"
rsync -r --info=progress2 --delete root@alpha.chatopswg.xyz:/root/containers/* /backup/chatopswg/alpha.chatopswg.xyz/temp

echo "Starting mongo and rocketchat"
ssh root@alpha.chatopswg.xyz "cd /root/containers; docker-compose -f ./rocketchat/docker-compose.yml up -d mongo; docker-compose -f ./rocketchat/docker-compose.yml up -d rocketchat"
