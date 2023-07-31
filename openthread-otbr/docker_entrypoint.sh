#!/bin/bash

/app/run-mqtt-sngateway.sh &

/app/etc/docker/docker_entrypoint.sh
