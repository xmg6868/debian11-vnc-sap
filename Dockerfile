FROM debian:11-slim


ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV VNC_PASSWORD=password


RUN apt update && apt install -y \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    novnc \
    websockify \
    supervisor \
    dbus-x11 \
    xterm \
    firefox-esr \
    wget \
    curl \
    net-tools \
    procps \
    && apt clean


RUN mkdir -p /root/.vnc


RUN echo "$VNC_PASSWORD" | vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd


COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


RUN chmod +x /start.sh


EXPOSE 8080


CMD ["/start.sh"]
