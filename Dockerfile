FROM consol/debian-xfce-vnc


# 修改 noVNC Web 端口
ENV VNC_PORT=6901
ENV NOVNC_PORT=8080


EXPOSE 8080


CMD ["/dockerstartup/startup.sh"]
