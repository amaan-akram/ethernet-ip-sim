#!/bin/sh

networkInterface=${@:-eth0}

echo "Starting sim on interface $networkInterface"

cd OpENer/bin/posix

echo "Running sim..."
./src/ports/POSIX/OpENer $networkInterface
