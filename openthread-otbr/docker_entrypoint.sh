#!/bin/bash

/app/wait-for-otbr.sh &

/app/etc/docker/docker_entrypoint.sh
