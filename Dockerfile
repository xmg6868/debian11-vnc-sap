FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1


RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update


RUN apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    supervisor \
    dbus-x11 \
    xterm \
    wget \
    curl \
    net-tools \
    procps \
    python3 \
    python3-pip \
    git \
    ca-certificates \
    && apt-get clean


RUN pip3 install websockify


RUN git clone https://github.com/novnc/noVNC.git /opt/novnc


RUN mkdir -p /root/.vnc


RUN echo "password" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd


COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


RUN chmod +x /start.sh


EXPOSE 8080


CMD ["/start.sh"]
