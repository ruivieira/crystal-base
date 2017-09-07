LOCAL_IMAGE="$(USER)/crystal-base"
WAIT_TIME=10

.PHONY: build clean run test

build:
	docker build -t $(LOCAL_IMAGE) .

clean:
	docker rmi -f $(LOCAL_IMAGE)

run:
	docker run -p 8888:8888 $(USER)/crystal-base

shell:
	docker run -it $(USER)/crystal-base /bin/bash

test:
	docker run -d --name crystal-base -p 8888:8888 $(USER)/crystal-base
	sleep $(WAIT_TIME)
	./ready.sh && echo "Test completed successfully!"
	docker rm -f crystal-scala