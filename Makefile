SHELL = /bin/bash
IMAGE_NAME?=egghead-reasonml-variant-recursive-type
IMAGE_TAG?=latest

.PHONY: build clean run

#
# Docker
#

run:
	docker run -it --rm ${IMAGE_NAME}:${IMAGE_TAG}

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

clean:
	docker ps -a| grep ${IMAGE_NAME} | awk '{print $$1}' | xargs -I {} docker rm -f {} || true
	docker images| grep ${IMAGE_NAME} | awk '{print $$3}' | xargs -I {} docker rmi -f {} || true

push: build
	docker push ${IMAGE_NAME}:${IMAGE_TAG}
