FROM ubuntu:rolling

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install git cmake build-essential qtbase5-dev libqt5serialport5-dev libusb-1.0-0-dev python3-dev libxrender-dev libavahi-core-dev libavahi-compat-libdnssd-dev

RUN git clone --recursive https://github.com/hyperion-project/hyperion.ng.git hyperion && cd hyperion
RUN mkdir build && cd build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make -j $(nproc)
RUN make install/strip
