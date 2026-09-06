FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV VNC_PASSWORD=password


RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    supervisor \
    dbus-x11 \
    xterm \
    python3 \
    python3-pip \
    git \
    wget \
    curl \
    ca-certificates \
    net-tools \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN pip3 install websockify


RUN git clone https://github.com/novnc/noVNC.git /opt/novnc \
    && git clone https://github.com/novnc/websockify /opt/novnc/utils/websockify


RUN mkdir -p /root/.vnc


RUN echo "$VNC_PASSWORD" | \
    vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd


COPY start.sh /start.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


RUN chmod +x /start.sh


EXPOSE 8080


CMD ["/start.sh"]
