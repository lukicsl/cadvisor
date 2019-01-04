APP_NAME=cadviser
APP_USERREPO=github.com/lukicsl
APP_PACKAGE=$(APP_USERREPO)/$(APP_NAME)
APP_VERSION=v0.30.2

PLUGIN_USER ?= lukics
PLUGIN_NAME ?= cadvisor
PLUGIN_TAG ?= linux-arm32v7-latest
PLUGIN_IMAGE ?= $(PLUGIN_USER)/$(PLUGIN_NAME):$(PLUGIN_TAG)

ERROR_COLOR=\033[31;01m
NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
WARN_COLOR=\033[33;01m

all: docker-image docker-image-push

docker-image:
	@echo -e "$(OK_COLOR)==> Docker build image : ${PLUGIN_IMAGE} $(NO_COLOR)"
	docker build --build-arg APP_VERSION=${APP_VERSION} -t ${PLUGIN_IMAGE} .

docker-image-push:
	@echo -e "$(OK_COLOR)==> push plugin : ${PLUGIN_IMAGE}$(NO_COLOR)"
	docker push ${PLUGIN_IMAGE}
