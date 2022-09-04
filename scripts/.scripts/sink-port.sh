#!/bin/sh
# Sgorblex's scripts
# ~/.scripts/sink-port.sh
# Switches to the next available port for the current audio sink.

set -e

amixer -c 1 sset 'Auto-Mute Mode' Disabled
DEFSINK=$(pactl get-default-sink)
SINKJSON=$(pactl -f json list sinks | jq ".[] | select(.name == \"$DEFSINK\")")
ACTIVEPORT=$(printf "%s" "$SINKJSON" | jq ".active_port")
PORTS=$(printf "%s" "$SINKJSON" | jq "[.ports[].name]")
INDEXACTIVEPORT=$(printf "%s" "$PORTS" | jq "index($ACTIVEPORT)")
NEWPORT=$(printf "%s" "$PORTS" | jq ".[($INDEXACTIVEPORT+1)% length]")
NEWPORT="${NEWPORT%\"}"
NEWPORT="${NEWPORT#\"}"
pactl set-sink-port @DEFAULT_SINK@ $NEWPORT
