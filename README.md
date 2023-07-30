# Deploy to Balena

[![balena deploy button](https://www.balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy)

# Overview

This repository provides a container for the OpenThread Border Router.

We build it using a modified Dockerfile taken from the OTBR repository [here](https://github.com/openthread/ot-br-posix/blob/main/etc/docker/Dockerfile)

- This is to ensure we have control over the settings we use for the build.

We also include the MQTT-SNGateway based on the block [here](https://github.com/DynamicDevices/mqttsn-gateway-block)

- TODO: This is because I haven't yet worked out how to route IPv6 packets successfully between containers to make them available to the mesh on interface `wpan0`

See the MQTT-SNGateway [README](https://github.com/DynamicDevices/mqttsn-gateway-block#readme) for details on default environment variable settings.

In addition you need to set `RUN_MQTT_SNGATWAY=1` to start up the gateway process.

Then the OpenThread Border Router web interface will run up on port 80 and you can `Form` or `Join` a network.

Use the settings in this image to conform to the MQTT-SN publication CLi example you can use [here](https://github.com/DynamicDevices/openthread/tree/ajl/adding-examples/examples/apps/mqtt-snpublish)

- PAN 0x4444
- Extended PAN 3333333344444444
- Network Key (used to be called Master Key) 33334444333344443333444433334444
- Channel 15
  
![image](https://github.com/DynamicDevices/openthread-border-router-block/assets/1537834/4c6f6e93-cbde-4bdd-b5a5-1df614e700c6)

# Building CLI test firmware for Nordic nrf52840

Until we have multicast advertising and `SEARCHGW` working properly you will need to go to the container and look at `ifconfig` to work out the IP address

Here we can take the IP address of the wpan0 interface

![image](https://github.com/DynamicDevices/openthread-border-router-block/assets/1537834/62cedf1d-e734-4ced-89f8-8b75823f9086)

Then compile the MQTT-SN enabled CLI publishing example as follows

```
$ git clone https://github.com/openthread/ot-nrf528xx.git
$ cd ot-nrf528xx && rm -Rf openthread
$ git clone https://github.com/DynamicDevices/openthread.git -b ajl/adding-examples
$ nano openthread/examples/apps/mqtt-snpublish/main.c 
```

Change the `GATEWEAY_ADDRESS` to the one for your OTBR (NOTE: In future we want to automatically detect this)

![image](https://github.com/DynamicDevices/openthread-border-router-block/assets/1537834/ce1777e1-8395-449b-b9f4-b07f255027f0)

```
$ ./script/build nrf52840 USB_trans -DOT_BOOTLOADER=USB -DOT_MQTT=ON -DOT_JOINER=ON -DOT_RCP_RESTORATION_MAX_COUNT=0 -DOT_LOG_LEVEL=WARN -DOT_UPTIME=ENABLED
$ arm-none-eabi-objcopy -O ihex build/bin/ot-cli-ftd-mqttsn-publish build/bin/ot-cli-ftd-mqttsn-publish.hex
```

Then use the Nordic programmer to program your dongle with the hex file
