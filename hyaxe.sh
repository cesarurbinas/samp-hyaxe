#!/bin/sh
log=samp.log
dat=`date`
samp="/root/hyaxe-samp/samp03svr"
cd /root/hyaxe-samp/
 
echo "${dat} watchdog script starting." >>${log}
while true; do
        echo "${dat} Server exited, restarting..." >>${log}
        mv /root/hyaxe-samp/server_log.txt /root/hyaxe-samp/logs/server_log.`date '+%m%d%y%H%M%S'`
        ${samp} >> $log
	sleep 2
done