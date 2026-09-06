FROM debian:11.11

ENV DEBIAN_FRONTEND=noninteractive


RUN rm -f /etc/apt/sources.list.d/* && \
    echo "deb http://archive.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf.d/99archive


RUN apt-get update && apt-get install -y --no-install-recommends \
    x11vnc \
    xvfb \
    xfce4 \
    supervisor \
    dbus-x11 \
    xterm \
    python3 \
    wget \
    curl \
    ca-certificates \
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
