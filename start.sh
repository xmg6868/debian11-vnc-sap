#!/bin/bash

export DISPLAY=:1


Xvfb :1 -screen 0 1280x720x24 &


sleep 3


startxfce4 &


sleep 5


x11vnc \
-display :1 \
-rfbauth /root/.vnc/passwd \
-forever \
-shared \
-bg


exec supervisord -n
