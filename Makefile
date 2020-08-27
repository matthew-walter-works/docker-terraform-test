all: build test

build:
	docker build -t terraform-test .

test:
	cd mycode
	docker run --rm -v $PWD:/go/src/mycode -i -t terraform-test

phony: build test