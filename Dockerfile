FROM ubuntu:xenial

# WITHOUT OPENCV

SHELL [ "/bin/bash" , "-c"]

# Installing required ubuntu packages for compiling the osdk cpp code
RUN apt-get update && apt upgrade -y
RUN apt-get install -y cmake g++ libavcodec-dev libavformat-dev libavfilter-dev build-essential git libusb-1.0-0-dev libssl-dev nano

# Add cloning OSDK git repo 
RUN cd /home && git clone https://github.com/dji-sdk/Onboard-SDK.git
# RUN cd /home && git clone https://github.com/dji-sdk/Onboard-SDK.git tags:4.0.1
# RUN cd /home && mv ./tags:4.0.1 ./Onboard-SDK

RUN cd /home/Onboard-SDK && mkdir build && cd build
RUN cd /home/Onboard-SDK/build && cmake .. && make && cp ../sample/platform/linux/common/UserConfig.txt bin/

WORKDIR /home/Onboard-SDK/build/bin