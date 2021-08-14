#
# See ./docs/contributing.md
#

OS := $(shell uname)

.PHONY: help
.DEFAULT_GOAL := help

HAS_PIP := $(shell command -v pip;)
HAS_PIPENV := $(shell command -v pipenv;)

ifdef HAS_PIPENV
	PIPENV_RUN:=pipenv run
	PIPENV_INSTALL:=pipenv install
else
	PIPENV_RUN:=
	PIPENV_INSTALL:=
endif

TEAM := luismayta
REPOSITORY_DOMAIN:=github.com
REPOSITORY_OWNER:=${TEAM}
AWS_VAULT ?= ${TEAM}
KEYBASE_OWNER ?= ${TEAM}
KEYBASE_PATH_TEAM_NAME ?=private
PROJECT := luismayta.github.io

AWS_PROFILE_NAME ?=

PYTHON_VERSION=3.8.0
NODE_VERSION=14.16.1
TERRAFORM_VERSION=1.0.5
PYENV_NAME="${PROJECT}"
GIT_IGNORES:=python,node,go,terraform
GIT_IGNORES_CUSTOM:= bin 
GPG_KEY="9AB4DB0D94F5BCFC758354DCA6D2034D223DDE58"
GI:=gi

# issues reviewers
REVIEWERS?=luismayta

# Configuration.
SHELL ?=/bin/bash
ROOT_DIR=$(shell pwd)
MESSAGE:=🍺️
MESSAGE_HAPPY?:="Done! ${MESSAGE}, Now Happy Hacking"
SOURCE_DIR=$(ROOT_DIR)
PROVISION_DIR:=$(ROOT_DIR)/provision
DOCS_DIR:=$(ROOT_DIR)/docs
README_TEMPLATE:=$(PROVISION_DIR)/templates/README.tpl.md
TERRAFORM_README_FILE := docs/include/terraform.md

export README_FILE ?= README.md
export README_YAML ?= provision/generators/README.yaml
export README_INCLUDES ?= $(file://$(shell pwd)/?type=text/plain)

FILE_README:=$(ROOT_DIR)/README.md
KEYBASE_VOLUME_PATH ?= /Keybase
KEYBASE_TEAM_PATH ?=${KEYBASE_VOLUME_PATH}/${KEYBASE_PATH_TEAM_NAME}/${KEYBASE_OWNER}
KEYBASE_PROJECT_PATH ?= ${KEYBASE_TEAM_PATH}/${REPOSITORY_DOMAIN}/${REPOSITORY_OWNER}/${PROJECT}

PATH_DOCKER_COMPOSE:=docker-compose.yml -f provision/docker-compose

DOCKER_SERVICE_DEV:=app
DOCKER_SERVICE_TEST:=app

docker-compose:=$(PIPENV_RUN) docker-compose

docker-test:=$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/test.yml
docker-dev:=$(docker-compose) -f ${PATH_DOCKER_COMPOSE}/dev.yml

docker-test-run:=$(docker-test) run --rm ${DOCKER_SERVICE_TEST}
docker-dev-run:=$(docker-dev) run --rm --service-ports ${DOCKER_SERVICE_DEV}
docker-yarn-run:=$(docker-dev) run --rm --service-ports ${DOCKER_SERVICE_YARN}

terragrunt:=terragrunt

include provision/make/*.mk

## Display help for all targets
.PHONY: help
help:
	@echo '${MESSAGE} Makefile for ${PROJECT}'
	@echo ''
	@awk '/^.PHONY: / { \
		msg = match(lastLine, /^## /); \
			if (msg) { \
				cmd = substr($$0, 9, 100); \
				msg = substr(lastLine, 4, 1000); \
				printf "  ${GREEN}%-30s${RESET} %s\n", cmd, msg; \
			} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Create README.md by building it from README.yaml
.PHONY: readme
readme:
	@make terraform.docs
	@gomplate --file $(README_TEMPLATE) \
		--out $(README_FILE)

## setup dependences of project
.PHONY: setup
setup:
	@echo "==> install packages..."
	make python.setup
	make python.precommit
	@[ -e ".env" ] || cp -rf .env.example .env
	make yarn.setup
	make git.setup
	@echo ${MESSAGE_HAPPY}

## setup environment for sre
.PHONY: setup.sre
setup.sre: setup
	@echo "----> install packages for SRE..."
	make terragrunt.setup
	@echo ${MESSAGE_HAPPY}

## setup environment of project
.PHONY: environment
environment:
	@echo "==> loading virtualenv ${PYENV_NAME}..."
	make python.environment
	make keybase.env
	make terragrunt.environment
	@echo ${MESSAGE_HAPPY}
