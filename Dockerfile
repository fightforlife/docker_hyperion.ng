FROM ubuntu:rolling

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget sudo

RUN wget -qO- https://raw.githubusercontent.com/hyperion-project/hyperion.ng/master/bin/compile.sh | sh
RUN cd ./hyperion/build && make install
RUN hyperiond