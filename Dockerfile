FROM alpine:3.3
MAINTAINER John Regan <john@jrjrtech.com>

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.16.0.1/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
RUN tar xvfz /tmp/s6-overlay.tar.gz -C / && apk add --update bash && apk add --update execline && rm -rf /var/cache/apk/*

##
## INIT
##

ENTRYPOINT [ "/init" ]
