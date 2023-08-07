#!/bin/bash

# Wait for DBUS to be up after boot
sleep 10

# Run up OTBR services
/app/etc/docker/docker_entrypoint.sh &

# TODO: Work out how to know OTBR is up
sleep 10

# Optionally form the network
/app/form-network.sh

# Run MQTT-SN Gateway
/app/run-mqtt-sngateway.sh

# Block so the container doesn't exit
while [ 1 ]
do
 sleep 10
done

