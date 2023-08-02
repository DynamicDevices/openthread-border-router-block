#!/bin/bash

# Check for wpan0 and run up the MQTT-SNGATEWWAY when it appears

if [ x"${RUN_MQTT_SNGATEWAY}" == "x1" ]
then

while [ 1 ]
do

while [ ! -e /sys/class/net/$MULTICAST_IPV6_IF ]
do
 sleep 5
 echo Waiting for $MULTICAST_IPV6_IF
done

while [ `cat /sys/class/net/$MULTICAST_IPV6_IF/operstate` == "down" ]
do
 sleep 5
 echo Waiting for $MULTICAST_IPV6_IF
done

./run-mqtt-sngateway.sh

done

fi
