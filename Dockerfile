FROM debian:11.11

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update


RUN apt-get install -y --no-install-recommends \
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


EXPOSE 8080

CMD ["/bin/bash"]
