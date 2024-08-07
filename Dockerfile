ARG UBUNTU_TAG=24.04

FROM ubuntu:${UBUNTU_TAG}

ARG UBUNTU_TAG
ARG DEBIAN_FRONTEND="noninteractive"

LABEL org.label-schema.name="Ubuntu Linux" \
      org.label-schema.description="Ubuntu Linux base image" \
      org.label-schema.url="https://hub.docker.com/_/ubuntu" \
      org.label-schema.version=${UBUNTU_TAG}

SHELL ["/bin/bash", "-exc"]

RUN apt-get update; \
    apt-get -y dist-upgrade; \
    apt-get -y --no-install-recommends --no-install-suggests install \
        gosu tzdata tini; \
    apt-get -y autopurge; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/tini" , "--"]
