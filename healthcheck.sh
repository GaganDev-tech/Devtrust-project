#!/bin/bash
ENDPOINT = "https://localhost:5000/health"
LOGFILE = "logs/healthcheck.log"

mkdir -p logs

while true; do
TIMESTAMP= $(date "+%Y-%m-%d %H)
RESPONSE =$(curl -s $ENDPOINT)
if [[ $RESPONSE == *"healthy"*]];
then echo "[$TIMESTAMP] SUCCESS: HEALTHY>> $LOGFILE
else
echo "[$TIMESTAMP] ALERT: UNHEALTHY >> $LOGFILE

fi 
sleep 30
done
