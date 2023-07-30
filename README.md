
This repository provides a container for the OpenThread Border Router.

We build it using a modified Dockerfile taken from the OTBR repository [here](https://github.com/openthread/ot-br-posix/blob/main/etc/docker/Dockerfile)

- This is to ensure we have control over the settings we use for the build.

We also include the MQTT-SNGateway based on the block [here](https://github.com/DynamicDevices/mqttsn-gateway-block)

- TODO: This is because I haven't yet worked out how to route IPv6 packets successfully between containers to make them available to the mesh on interface `wpan0`

See the MQTT-SNGateway [README](https://github.com/DynamicDevices/mqttsn-gateway-block#readme) for details on default environment variable settings.

In addition you need to set `RUN_MQTT_SNGATWAY=1` to start up the gateway process.

Then the OpenThread Border Router web interface will run up on port 80 and you can `Form` or `Join` a network.

TODO:
- Images for webui
- Details on forming gateway for default CLI MQTT-SN build
- Testing

# Deploy to Balena

[![balena deploy button](https://www.balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy)
