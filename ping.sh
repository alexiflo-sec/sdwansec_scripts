#!/bin/bash

# Blocked DNS address
IP_ADDRESS_1="8.8.4.4"

# Blocked Guest IP
IP_ADDRESS_2="192.168.30.11"

# Number of pings
PING_COUNT=10

# Ping loop
for ((i=1; i<=$PING_COUNT; i++))
do
    echo "Ping $i:"
    ping -c 1 $IP_ADDRESS_1
done

for ((i=1; i<=$PING_COUNT; i++))
do
    echo "Ping $i:"
    ping -c 1 $IP_ADDRESS_2
done
#echo "PING script finished at $(date)" >> $HOME/Downloads/runs.txt
