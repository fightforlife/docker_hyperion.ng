FROM ubuntu:rolling

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl wget sudo

RUN wget -qO- https://raw.githubusercontent.com/hyperion-project/hyperion.ng/master/bin/compile.sh | sh

