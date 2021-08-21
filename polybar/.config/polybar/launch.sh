#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-main.log
polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown

echo "Polybar bar launched..."
