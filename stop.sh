#!/bin/bash

# before runing run chmod +x stop.sh


# this place must be the same as in start.sh
SCREEN_NAME="mc"



screen -S "$SCREEN_NAME" -p 0 -X stuff "stop\015"

echo "Sent /stop to the server. Saving and shutting down in the background..."

screen -wipe > /dev/null 2>&1

