RELEASE ?= 0.0.1

default:
	echo doing nothing

build:
	docker build . -t rmc-builder-debian8
	docker create --name rmc-builder-debian8 rmc-builder-debian8:latest
	docker cp rmc-builder-debian8:/go/src/rmc/rmc ./rmc-$(RELEASE)-debian8
	docker rm -f rmc-builder-debian8
