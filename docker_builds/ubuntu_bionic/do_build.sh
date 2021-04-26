#!/bin/bash
set -e
cd /root


apt update
apt install -y dpkg-dev make gcc-8 g++-8 cmake git libfftw3-dev libglfw3-dev libglew-dev libvolk1-dev libsoapysdr-dev libairspyhf-dev libairspy-dev libiio-dev libad9361-dev librtaudio-dev libhackrf-dev librtlsdr-dev

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8

git clone https://github.com/AlexandreRouma/SDRPlusPlus

cd SDRPlusPlus
mkdir build
cd build
cmake ..
make CXX_FLAGS=-DUSE_OLD_VOLK_ADD=1 -j2

cd ..
sh make_debian_package.sh ./build