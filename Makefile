RELEASE ?= 0.0.2

default:
	echo doing nothing

build-for-debian8:
	docker build . -t rmc-builder-debian8 -f Dockerfile.builder-debian8
	-docker rm -f rmc-builder-debian8
	docker create --name rmc-builder-debian8 rmc-builder-debian8:latest
	docker cp rmc-builder-debian8:/go/src/rmc/rmc ./rmc-$(RELEASE)-debian8
	docker rm -f rmc-builder-debian8

build-for-u1804:
	docker build . -t rmc-builder-u1804 -f Dockerfile.builder-u1804
	-docker rm -f rmc-builder-u1804
	docker create --name rmc-builder-u1804 rmc-builder-u1804:latest
	docker cp rmc-builder-u1804:/go/src/rmc/rmc ./rmc-$(RELEASE)-u1804
	docker rm -f rmc-builder-u1804
