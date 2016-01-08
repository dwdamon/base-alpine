FROM alpine:3.3
MAINTAINER David Damon <dwdamon@gmail.com>

##
## ROOTFS
##

# root filesystem
COPY rootfs /


# Java Version
ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 45
ENV JAVA_VERSION_BUILD 14
ENV JAVA_PACKAGE       jdk

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.16.0.1/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
RUN tar xvfz /tmp/s6-overlay.tar.gz -C / \
  && apk add --update bash \
  && apk add --update execline \
  && rm -rf /var/cache/apk/*

##
## INIT
##

ENTRYPOINT [ "/init" ]
