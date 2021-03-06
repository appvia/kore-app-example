SHELL = /bin/sh -e
NAME=kore-example
AUTHOR ?= appvia
AUTHOR_EMAIL=kore@appvia.io
REGISTRY=quay.io
VERSION ?= latest

.PHONY: build release

default: build

build:
	@echo "--> Building docker image"
	docker build -t ${REGISTRY}/${AUTHOR}/${NAME}:${VERSION} -f images/Dockerfile .

release:
	@docker push ${REGISTRY}/${AUTHOR}/${NAME}:${VERSION}

verify-circleci:
	@echo "--> Verifying the circleci config"
	@docker run -ti --rm -v ${PWD}:/workspace \
		-w /workspace circleci/circleci-cli \
		circleci config validate
