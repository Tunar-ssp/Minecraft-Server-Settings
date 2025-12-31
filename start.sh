#!/bin/bash

# before runing run chmod +x start.sh

# this is used when server is in the root and server folder named as Server
# change it to your server folder path
# example: /home/ubuntu/Server




SERVER_DIR="/home/ubuntu/Server"
JAR_NAME="server.jar"
# also backup screen name too (you can check the background name with screen -S <screen_name>(it is mc for this one))  
SCREEN_NAME="mc"
# and you  could change minimum and maximum memory for server based on your server specs
MIN_MEM="6144M" 
MAX_MEM="7200M"

screen -wipe > /dev/null 2>&1

if [ "$TERM" != "screen" ] && [ -z "$STY" ]; then
    if screen -list | grep -q "\.${SCREEN_NAME}"; then
        echo "Server is already running! Type: screen -r $SCREEN_NAME"
        exit 1
    fi
    
    echo "Cleaning up and launching Minecraft in background..."
    screen -dmS "$SCREEN_NAME" /bin/bash "$0"
    sleep 1
    echo "Done! Type 'screen -r $SCREEN_NAME' to see the console."
    exit 0
fi

cd "$SERVER_DIR" || exit

# Max Performance Java 
java -Xms$MIN_MEM -Xmx$MAX_MEM \
  -XX:+UseG1GC \
  -XX:+ParallelRefProcEnabled \
  -XX:MaxGCPauseMillis=200 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+DisableExplicitGC \
  -XX:+AlwaysPreTouch \
  -XX:G1NewSizePercent=30 \
  -XX:G1MaxNewSizePercent=40 \
  -XX:G1HeapRegionSize=8M \
  -XX:G1ReservePercent=20 \
  -XX:G1HeapWastePercent=5 \
  -XX:G1MixedGCCountTarget=4 \
  -XX:InitiatingHeapOccupancyPercent=15 \
  -XX:G1MixedGCLiveThresholdPercent=90 \
  -XX:G1RSetUpdatingPauseTimePercent=5 \
  -XX:SurvivorRatio=32 \
  -XX:+PerfDisableSharedMem \
  -XX:MaxTenuringThreshold=1 \
  -Dusing.aikars.flags=true \
  -Daikars.new.flags=true \
  -jar $JAR_NAME nogui