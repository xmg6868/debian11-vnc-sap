FROM debian:11.11

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1


RUN rm -f /etc/apt/sources.list.d/* && \
    echo "deb http://archive.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99archive && \
    apt-get update


RUN apt-get install -y --no-install-recommends \
RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4-core \
    xfce4-terminal \
    x11vnc \
    xvfb \
    supervisor \
    dbus-x11 \
    xterm \
    python3 \
    wget \
    curl \
    ca-certificates \
    git \
    && apt-get -f install -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/novnc/noVNC.git /opt/novnc


RUN mkdir -p /root/.vnc && \
    x11vnc -storepasswd password /root/.vnc/passwd


COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


RUN chmod +x /start.sh


EXPOSE 8080


CMD ["/start.sh"]
