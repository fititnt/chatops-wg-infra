#!/bin/bash
#===============================================================================
#
#          FILE:  restore-alpha.chatopswg.xyz.sh
#
#         USAGE:  ./restore-alpha.chatopswg.xyz.sh
#
#   DESCRIPTION:  Restore a backup created with backup-alpha.chatopswg.xyz.sh.
#                 Stop MongoDB and Rocket.Chat if necessary, then rsync local
#                 folder with remote cadu /root/containers folder, then start
#                 MongoDB and Rocket.Chat.
#
#       OPTIONS:  ---
#  REQUIREMENTS:  Requires passwordless `ssh root@alpha.chatopswg.xyz`.
#                 Requires that cadu already has a working docker, with all
#                 containers working, even if no content.
#          BUGS:  TODO 1: this script should stop for any error (fititnt, 2017-09-05 01:08 BRT)
#                 TODO 2: this script should only restore if local folder really have some content (avoid destroy remote)
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <emerson@alligo.com.br>
#       COMPANY:  Alligo
#       VERSION:  1.0
#       CREATED:  2018-01-21 12:05:00 BRT
#      REVISION:  ---
#===============================================================================

echo "Restore alpha.chatopswg.xyz server in 5 seconds..."

sleep 5

echo "Stoping mongo and rocketchat (if are running...)"
ssh root@alpha.chatopswg.xyz "cd /root/containers; docker-compose -f ./rocketchat/docker-compose.yml stop rocketchat; docker-compose -f ./rocketchat/docker-compose.yml stop mongo"

sleep 3 # remove-me

set -e # Needs revision, script should stop if user try to stop from command line

echo "rsync"
rsync -r --info=progress2 --delete /backup/chatopswg/alpha.chatopswg.xyz/temp/* root@alpha.chatopswg.xyz:/root/containers

echo "Starting mongo and rocketchat"
ssh root@alpha.chatopswg.xyz "cd /root/containers; docker-compose -f ./rocketchat/docker-compose.yml up -d mongo; docker-compose -f ./rocketchat/docker-compose.yml up -d rocketchat"
