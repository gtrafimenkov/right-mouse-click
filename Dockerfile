FROM golang:1.8-jessie

RUN apt-get update
RUN apt-get install -y gcc libc6-dev

RUN apt-get install -y libx11-dev
RUN apt-get install -y xorg-dev
RUN apt-get install -y libxtst-dev libpng++-dev

RUN apt-get install -y xcb libxcb-xkb-dev x11-xkb-utils libx11-xcb-dev libxkbcommon-x11-dev
RUN apt-get install -y libxkbcommon-dev

RUN apt-get install -y xsel
RUN apt-get install -y xclip

WORKDIR /go/src/rmc
COPY / ./
RUN go build
