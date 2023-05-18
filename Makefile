DOCKER_HELM_UNITITEST_IMAGE := helmunittest/helm-unittest:3.11.2-0.3.0

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

cmd: ## A command
	@echo "YOUR COMMAND"

unit-test: checkelm ## Execute Unit tests via Container  -c "/bin/sh"
	$(info Running unit tests in docker...)
	@docker run \
		-v $(shell pwd)/example-chart:/apps/\
		-it --rm  $(DOCKER_HELM_UNITITEST_IMAGE) -f tests/*.yaml .

unit-test-local: ## Execute Unit tests locally
	helm unittest -f 'tests/*.yaml' example-chart

unit-test-local-output: ## Execute Unit tests locally with output
	helm unittest -f 'tests/*.yaml' -o unittests.xml -t JUnit example-chart