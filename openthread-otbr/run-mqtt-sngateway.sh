
# Modify defaults per environment variables
sed "s/ENV_BROKER_NAME/${BROKER_NAME}/" gateway.conf.in > gateway.conf
sed -i "s/ENV_BROKER_PORT/${BROKER_PORT}/" gateway.conf
sed -i "s/ENV_BROKER_SECURE_PORT/${BROKER_SECURE_PORT}/" gateway.conf
sed -i "s/ENV_GATEWAY_PORT/${GATEWAY_PORT}/" gateway.conf
sed -i "s/ENV_GATEWAY_IPV6_PORT/${GATEWAY_IPV6_PORT}/" gateway.conf
sed -i "s/ENV_MULTICAST_IPV6_PORT/${MULTICAST_IPV6_PORT}/" gateway.conf
sed -i "s/ENV_MULTICAST_IPV6_IF/${MULTICAST_IPV6_IF}/" gateway.conf
sed -i "s/ENV_MULTICAST_IPV6_HOPS/${MULTICAST_IPV6_HOPS}/" gateway.conf
sed -i "s/ENV_MULTICAST_IPV6/${MULTICAST_IPV6}/" gateway.conf

export LD_LIBRARY_PATH=.

if [ x"${RUN_MQTT_SNGATEWAY}" == "x1" ]
then

 if [ -z "${SENSORNET}" ]
 then
   ./MQTT-SNGateway.udp
 else
   ./MQTT-SNGateway.${SENSORNET}
 fi
fi


