#!/bin/bash
# Author: 	Parker Bailey
# Date: 	12/15/2021
# Version:	1.0

# variables
src=/serverfiles/
dest=/mnt/md0/minecraft_server_backups
pass=/home/parker/.keys/balenascp

# Backup directory 'serverfiles' from balenaminecraft server
nohup rm -r $dest/serverfiles/ >/dev/null 2>&1 &
nohup sshpass -f $pass scp -prv root@192.168.0.12:$src $dest/ >/dev/null 2>&1 &
nohup tar czvf $dest/$(date +"%Y-%m-%d").tar.gz $dest/serverfiles/ >/dev/null 2>&1 &
nohup rm -r $dest/serverfiles/ >/dev/null 2>&1 &
