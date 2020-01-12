FROM ubuntu:rolling

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl wget git cmake

RUN git clone --recursive https://github.com/hyperion-project/hyperion.ng.git hyperion && cd hyperion
RUN mkdir build && cd build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make -j $(nproc)
RUN make install/strip
