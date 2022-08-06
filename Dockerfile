FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# Package installation
RUN apt-get update
## Common packages for linux build environment
RUN apt-get install -y clang libc++-dev libc++abi-dev python python-six python3-six pkg-config git curl bzip2 unzip make ninja-build
## Packages for linux desktop version
RUN apt-get install -y libibus-1.0-dev libglib2.0-dev qtbase5-dev libgtk2.0-dev libxcb-xfixes0-dev
## Packages for misc tools
RUN apt-get install -y nano

## For Bazel
## https://docs.bazel.build/versions/master/install-ubuntu.html
RUN apt-get install -y curl gnupg libncurses5 build-essential devscripts
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
RUN mv bazel.gpg /etc/apt/trusted.gpg.d/
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN sed -i -E "s/# deb-src/deb-src/" /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y bazel
RUN apt-get install -y python3-dev gyp protobuf-compiler libprotobuf-dev libqwt-qt5-dev libgwengui-qt5-dev libuim-dev libzinnia-dev fcitx-libs-dev desktop-file-utils

# Working environemnt
ENV HOME /home/mozc_builder
RUN useradd --create-home --shell /bin/bash --base-dir /home mozc_builder
USER mozc_builder
RUN mkdir -p /home/mozc_builder/work
WORKDIR /home/mozc_builder/work

RUN apt-get source ibus-mozc
RUN mv mozc-* mozc

COPY ./mozcdic-ut-20220623.txt ./mozcdic-ut.txt
RUN cat ./mozcdic-ut.txt >> mozc/src/data/dictionary_oss/dictionary00.txt

WORKDIR /home/mozc_builder/work/mozc

RUN EDITOR=/bin/true dpkg-source -q --commit . ut2
RUN dpkg-buildpackage -us -uc
WORKDIR /home/mozc_builder/work
RUN mkdir -p deb
RUN cp *.deb ./deb/
# RUN bazel build package --config oss_linux -c opt
# WORKDIR /home/mozc_builder/work/mozc
# RUN debuild -b -uc -us -d
