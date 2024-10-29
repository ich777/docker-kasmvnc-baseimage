FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="admin@minenet.at"
LABEL org.opencontainers.image.source="https://github.com/ich777/docker-kasmvnc-baseimage"

ARG KASMVNC="placeholder"
ARG DIST_REL="bookworm"

RUN cd /tmp && \
    KASMVNC_V="$(wget -qO- https://api.github.com/repos/kasmtech/KasmVNC/releases/latest | grep tag_name | cut -d '"' -f4 | sed 's/v//g')" && \
	wget -O /tmp/kasmvncserver.deb https://github.com/kasmtech/KasmVNC/releases/download/v${KASMVNC_V}/kasmvncserver_${DIST_REL}_${KASMVNC_V}_amd64.deb && \
	apt-get update && \
	apt-get -y install /tmp/kasmvncserver.deb

RUN apt-get update && \
	apt-get -y install --no-install-recommends fluxbox screen libxcomposite-dev libxcursor1 xauth && \
	rm -rf /var/lib/apt/lists/* /tmp/kasmvncserver.deb

ENV CUSTOM_RES_W=640
ENV CUSTOM_RES_H=480