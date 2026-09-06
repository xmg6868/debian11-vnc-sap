#!/bin/bash

mkdir -p /tmp/runtime-root
chmod 700 /tmp/runtime-root

export XDG_RUNTIME_DIR=/tmp/runtime-root


tigervncserver :1 \
    -geometry 1280x720 \
    -depth 24 \
    -localhost no


exec supervisord -n
