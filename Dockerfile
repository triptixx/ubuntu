ARG UBUNTU_TAG=22.04

FROM ubuntu:${UBUNTU_TAG}

ARG UBUNTU_TAG
ARG DEBIAN_FRONTEND="noninteractive"
ENV ENV="/etc/profile"

LABEL org.label-schema.name="Ubuntu Linux" \
      org.label-schema.description="Ubuntu Linux base image" \
      org.label-schema.url="https://hub.docker.com/_/ubuntu" \
      org.label-schema.version=${UBUNTU_TAG}

SHELL ["/bin/bash", "-exc"]

RUN apt-get update; \
    apt-get -y upgrade; \
    apt-get -y --no-install-recommends --no-install-suggests install \
        gosu tzdata tini; \
    apt-get -y autopurge; \
    apt-get clean
    # rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY *.sh /etc/profile.d/

ENTRYPOINT ["/sbin/tini" , "--"]
