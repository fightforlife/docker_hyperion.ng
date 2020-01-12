FROM ubuntu:rolling

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget sudo git cmake build-essential qtbase5-dev libqt5serialport5-dev libusb-1.0-0-dev python3-dev libxrender-dev libavahi-core-dev libavahi-compat-libdnssd-dev

RUN git clone --recursive https://github.com/hyperion-project/hyperion.ng.git hyperion
RUN mkdir ./hyperion/build
RUN cd ./hyperion/build && cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cd ./hyperion/build && make -j $(nproc)
RUN cd ./hyperion/build && make install/strip


CMD ["hyperiond", ""]