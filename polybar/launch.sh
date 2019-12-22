#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "---" >> /tmp/polybar_top.log
polybar top >> /tmp/polybar_top.log 2>&1 &

echo "Bars launched"
