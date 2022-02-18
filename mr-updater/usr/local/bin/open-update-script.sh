#!/bin/bash
sleep 10
export DISPLAY=:0
exec /usr/local/bin/trigger-update.sh /bin/sh 
#~ export DISPLAY=:1
#~ sleep 3 && \
#~ sakura -h -e "pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY sh /usr/local/bin/trigger-update.sh" 
