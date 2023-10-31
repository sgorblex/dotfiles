#!/bin/sh

TIMER=5

cd ${0%/*}

echo "Running since $(date +'%F %H:%M:%S')" >> /tmp/cont_disp.log
while true; do
	./display.sh
	sleep "$TIMER"
done
