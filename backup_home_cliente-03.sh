#!/bin/bash
#script

if nc -z 192.168.20.3 22 2>/dev/null; then
    mkdir -p /media/disco_backups/logs
    echo "Starting backup"
    sshpass -p 'roo' rsync -avzh --exclude='.cache' --stats --progress --times --delete cliente03@192.168.20.3:/home /media/disco_backups >> /media/disco_backups/logs/backup_home_cliente-02.sh_$(date +%Y-%m-%d)_$(date +%H-%M-%S)Z.log
    echo "Finished"
else
    echo "Server down"
fi    