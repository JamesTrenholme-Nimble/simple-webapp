# Name of the Docker image
IMAGE_NAME = webapp
# Tag for the Docker image
IMAGE_TAG = latest
# Name of the Docker container
CONTAINER_NAME = webapp

# Default target to be executed when no arguments are given to make
default: run

# Target for building the Docker image
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# Target for running the Docker container
run: build
	docker run --name $(CONTAINER_NAME) -p 3000:5000 -v $(PWD):/app $(IMAGE_NAME):$(IMAGE_TAG)

# Target for stopping the Docker container
stop:
	docker stop $(CONTAINER_NAME)

# Target for removing the Docker container
clean: stop
	docker rm $(CONTAINER_NAME)

# Phony target to avoid file name conflict
.PHONY: default build run stop clean