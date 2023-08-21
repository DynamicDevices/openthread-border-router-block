#!/bin/bash

if [ x"${AUTO_FORM_NETWORK}" == "x1" ]
then

echo Setting up OpenThread Network

# TODO: Check response for "Done" success...

/usr/sbin/ot-ctl ifconfig down
/usr/sbin/ot-ctl thread stop
/usr/sbin/ot-ctl dataset init new
/usr/sbin/ot-ctl dataset channel $THREAD_CHANNEL
/usr/sbin/ot-ctl dataset panid $THREAD_PAN_ID
/usr/sbin/ot-ctl dataset extpanid $THREAD_EXT_PAN_ID
/usr/sbin/ot-ctl dataset networkname $THREAD_NETWORK_NAME
/usr/sbin/ot-ctl dataset networkkey $THREAD_NETWORK_KEY
/usr/sbin/ot-ctl dataset commit active
/usr/sbin/ot-ctl prefix add $THREAD_IPV6_PREFIX
/usr/sbin/ot-ctl ifconfig up
/usr/sbin/ot-ctl thread start
/usr/sbin/ot-ctl netdata register

echo Done Setting Up Network

fi

