#!/bin/bash
#===============================================================================
#
#          FILE:  sync-local-to-homolog-ia-js-botkit.sh
#
#         USAGE:  ./sync-local-to-homolog-ia-js-botkit.sh
#
#   DESCRIPTION:  Sync local development files to homog server
#
#
#       OPTIONS:  ---
#  REQUIREMENTS:  Optimal onchance.sh, via https://gist.github.com/senko/1154509
#          BUGS:  ---
#         NOTES:
#        AUTHOR:  Emerson Rocha <emerson@alligo.com.br>
#       COMPANY:  CS
#       VERSION:  1.0
#       CREATED:  2018-01-10 19-03:00 BRTS
#      REVISION:  ---
#===============================================================================

# To listen chances and automatic upload, run
#   cd /alligo/code/fititnt/chatops-wg-ia-js-botkit
#   onchange.sh /alligo/code/fititnt/chatops-wg-infra/tools/sync/sync-local-to-homolog-ia-js-botkit.sh

rsync -tir --chmod=ugo+rwx /alligo/code/fititnt/chatops-wg-ia-js-botkit/ root@chatopswg.alligo.com.br:/root/containers/ia-js-botkit
