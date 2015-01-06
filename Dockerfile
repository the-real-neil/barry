FROM ubuntu:latest
MAINTAINER rubicks

RUN apt-get -qq update
RUN apt-get -qq dist-upgrade
RUN apt-get -qq install make autoconf automake libtool git mingw32 mingw32-binutils mingw32-runtime wine
RUN useradd luser
ADD . /home/luser
WORKDIR /home/luser
CMD /bin/bash ./build-o-matic.sh
