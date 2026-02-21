#!/bin/bash

# Defineis l'URL de icecast i les credencials
ICECAST_URL="icecast-sergigallart:8000/radio-sergigallart.mp3"
STREAMER_CONTAINER="streamer-sergigallart"

# Comença l'stream principal a les8:00
if [ "$(date +%H:%M)" == "08:00" ]; then
    docker start $STREAMER_CONTAINER
    echo "Main stream started at 8:00."
fi

# Canvia l'stream a les 14:00
if [ "$(date +%H:%M)" == "14:00" ]; then
    docker exec $STREAMER_CONTAINER /bin/bash -c "kill $(pgrep ffmpeg)"  # Stop the current stream
    docker exec $STREAMER_CONTAINER /bin/bash -c "ffmpeg -re -i /audio/canco2.mp3 ..."  # Start the new stream
    echo "Stream changed to different track at 14:00."
fi

# Para l'stream a les 22:00
if [ "$(date +%H:%M)" == "22:00" ]; then
    docker stop $STREAMER_CONTAINER
    echo "Stream stopped at 22:00."
fi
