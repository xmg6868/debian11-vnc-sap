FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1


RUN rm -f /etc/apt/sources.list.d/* && \
    echo "deb http://archive.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99archive && \
    apt-get update


RUN apt-get install -y --no-install-recommends \
    xfce4 \
    x11vnc \
    supervisor \
    dbus-x11 \
    xterm \
    python3 \
    wget \
    curl


EXPOSE 8080


CMD ["/bin/bash"]
