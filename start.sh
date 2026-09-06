#!/bin/bash


mkdir -p /root/.vnc


vncserver :1 \
 -geometry 1280x720 \
 -depth 24 \
 -localhost no


exec supervisord -n
