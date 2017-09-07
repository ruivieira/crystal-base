LOCAL_IMAGE="$(USER)/crystal-base"

.PHONY: build clean run

build:
	docker build -t $(LOCAL_IMAGE) .

clean:
	docker rmi -f $(LOCAL_IMAGE)

run:
	docker run -p 8888:8888 $(USER)/crystal-base

shell:
	docker run -it $(USER)/crystal-base /bin/bash