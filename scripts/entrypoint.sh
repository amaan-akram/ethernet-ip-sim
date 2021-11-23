#!/bin/sh

networkInterface=${@:-eth0}

echo "Starting sim on interface $networkInterface"

cd rta-ethernet-ip-stack

echo "Running sim..."
./rta-server $networkInterface
