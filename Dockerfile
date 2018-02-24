FROM debian:jessie-slim

RUN apt-get update
RUN apt-get install -y curl

RUN curl -OL https://github.com/devops-toolkit/golang-deb-packages/releases/download/2018-02-24/golang_1.10.0.0_amd64.deb
RUN dpkg -i golang_1.10.0.0_amd64.deb

RUN apt-get install -y libc6-dev

RUN apt-get install -y libx11-dev
RUN apt-get install -y xorg-dev
RUN apt-get install -y libxtst-dev libpng++-dev

RUN apt-get install -y xcb libxcb-xkb-dev x11-xkb-utils libx11-xcb-dev libxkbcommon-x11-dev
RUN apt-get install -y libxkbcommon-dev

RUN apt-get install -y xsel
RUN apt-get install -y xclip
RUN apt-get install -y git
RUN apt-get install -y clang

WORKDIR /go/src/rmc
COPY / ./
RUN go get -u golang.org/x/vgo
RUN cp .netrc ~/
RUN ~/go/bin/vgo build
