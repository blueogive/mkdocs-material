.PHONY : docker-prune docker-check docker-build docker-push

PIP_REQ_FILE := pip-req.txt
# PIP_REQ_FILE := pip-req-no-version.txt
DKR_IMG_NAME := mkdocs-material
VCS_URL := $(shell git remote get-url --push gh)
VCS_REF := $(shell git rev-parse --short HEAD)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")
TAG_DATE := $(shell date -u +"%Y%m%d")

docker-prune :
	@echo Pruning Docker images/containers/networks not in use
	docker system prune

docker-check :
	@echo Computing reclaimable space consumed by Docker artifacts
	docker system df

docker-build: Dockerfile $(PIP_REQ_FILE)
	@docker build \
	--build-arg PIP_REQ_FILE=$(PIP_REQ_FILE) \
	--build-arg VCS_URL=$(VCS_URL) \
	--build-arg VCS_REF=$(VCS_REF) \
	--build-arg BUILD_DATE=$(BUILD_DATE) \
	--tag blueogive/$(DKR_IMG_NAME):$(TAG_DATE) \
	--tag blueogive/$(DKR_IMG_NAME):latest .

docker-push : docker-build
	@docker push blueogive/$(DKR_IMG_NAME):$(TAG_DATE)
	@docker push blueogive/$(DKR_IMG_NAME):latest
