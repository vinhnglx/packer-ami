.PHONY: generate init validate build help

.DEFAULT_GOAL = help

generate: ## generate json-credential file
	./generate.sh

init: ## init base
	./init.sh

validate: ## validate AMI json
	./validate.sh

build: ## build the AMI from json
	./build.sh

help:
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'