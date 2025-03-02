#!/bin/bash

# Wait for DBUS to be up after boot
echo Waiting for system to come up 1..2..3..
sleep 60

# Run up OTBR services
echo Running OTBR services
/app/etc/docker/docker_entrypoint.sh &

# TODO: Work out how to know OTBR is up
sleep 30

# Optionally form the network
echo Forming Network
/app/form-network.sh

# Optionally run MQTT-SN gateway in this container
echo Running MQTT-SN gateway
/app/run-mqtt-sngateway.sh

# Block so the container doesn't exit
echo Sleeping...
while [ 1 ]
do
 sleep 10
done

