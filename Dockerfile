FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1


RUN rm -f /etc/apt/sources.list.d/* && \
    echo "deb http://archive.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99archive && \
    apt-get update


RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-terminal \
    tigervnc-common \
    tigervnc-tools \
    tigervnc-scraping-server \
    supervisor \
    dbus-x11 \
    xterm \
    python3 \
    python3-pip \
    wget \
    curl \
    ca-certificates \
    net-tools \
    procps \
    && apt-get -f install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


EXPOSE 8080


CMD ["/bin/bash"]
