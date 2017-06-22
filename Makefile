IMAGE_FILE?=image.yaml
COMMIT?=$(shell git rev-parse HEAD | cut -c1-8)
IMAGE_VERSION?=latest
REPO?=$(shell cat $(IMAGE_FILE) | grep "^name:" | cut -d' ' -f2)
DOCKER_BUILD_OPTS?=
ARTIFACT_DIR=${CURDIR}/build/distributions
DOCKER?=docker

build: 
	echo "Running docker build $(REPO)"
	cp -r $(ARTIFACT_DIR)/* $(CURDIR)/build/
	dogen --scripts $(CURDIR)/scripts --verbose $(IMAGE_FILE) build
	$(DOCKER) build $(DOCKER_BUILD_OPTS) -t $(REPO):$(COMMIT) $(CURDIR)/build

push:
	$(DOCKER) tag $(REPO):$(COMMIT) $(DOCKER_REGISTRY)/$(REPO):$(COMMIT)
	$(DOCKER) push $(DOCKER_REGISTRY)/$(REPO):$(COMMIT)

snapshot:
	$(DOCKER) tag $(REPO):$(COMMIT) $(DOCKER_REGISTRY)/$(REPO):$(IMAGE_VERSION)
	$(DOCKER) push $(DOCKER_REGISTRY)/$(REPO):$(IMAGE_VERSION)

clean:
	rm -rf build

.PHONY: build push snapshot clean
