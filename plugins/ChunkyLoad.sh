#!/bin/bash
cd "$(dirname "$0")"

# Don't make minimum to much it can crush your computer
java \
-Xms8G \
-Xmx11G \
-XX:+UseG1GC \
-XX:+ParallelRefProcEnabled \
-XX:MaxGCPauseMillis=200 \
-XX:+UnlockExperimentalVMOptions \
-XX:+DisableExplicitGC \
-XX:+AlwaysPreTouch \
-XX:G1NewSizePercent=40 \
-XX:G1MaxNewSizePercent=60 \
-XX:G1ReservePercent=15 \
-DPaper.WorkerThreadCount=12 \
-Dusing.aikars.flags=true \
-Daikars.new.flags=true \
-jar server.jar nogui
