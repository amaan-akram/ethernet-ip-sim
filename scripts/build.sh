#!/bin/sh

cd OpENer/bin/posix

./setup_posix.sh

make | tee opener-make.log

setcap cap_net_raw+ep ./src/ports/POSIX/OpENer

