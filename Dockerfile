FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="admin@minenet.at"
LABEL org.opencontainers.image.source="https://github.com/ich777/docker-kasmvnc-baseimage"

ARG KASMVNC="placeholder"

RUN cd /tmp && \
	wget -O /tmp/kasmvncserver.deb https://kasmweb-build-artifacts.s3.amazonaws.com/kasmvnc/fa884809145e0ba6e5e1da49887a82b5cab0a1d1/kasmvncserver_bookworm_1.1.1_master_fa8848_amd64.deb && \
	apt-get update && \
	apt-get -y install /tmp/kasmvncserver.deb

RUN apt-get update && \
	apt-get -y install --no-install-recommends fluxbox screen libxcomposite-dev libxcursor1 xauth && \
	rm -rf /var/lib/apt/lists/*

ENV CUSTOM_RES_W=640
ENV CUSTOM_RES_H=480