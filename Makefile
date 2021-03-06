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
PROJECT_PORT := 3000

AWS_PROFILE_NAME ?=

PYTHON_VERSION=3.8.0
NODE_VERSION=14.15.5
TERRAFORM_VERSION=0.14.5
PYENV_NAME="${PROJECT}"
GIT_IGNORES:=python,node,go,terraform
GI:=gi
GPG_KEY="9AB4DB0D94F5BCFC758354DCA6D2034D223DDE58"

# Configuration.
SHELL ?=/bin/bash
ROOT_DIR=$(shell pwd)
MESSAGE:=🍺️
MESSAGE_HAPPY?:="Done! ${MESSAGE}, Now Happy Hacking"
SOURCE_DIR=$(ROOT_DIR)
PROVISION_DIR:=$(ROOT_DIR)/provision
DOCS_DIR:=$(ROOT_DIR)/docs
README_TEMPLATE:=$(PROVISION_DIR)/templates/README.md.gotmpl

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

include provision/make/*.mk

help:
	@echo '${MESSAGE} Makefile for ${PROJECT}'
	@echo ''
	@echo 'Usage:'
	@echo '    environment               create environment with pyenv'
	@echo '    readme                    build README'
	@echo '    setup                     install requirements'
	@echo '    setup.sre                 install requirements for sre developer'
	@echo ''
	@make app.help
	@make aws.help
	@make alias.help
	@make docker.help
	@make docs.help
	@make test.help
	@make keybase.help
	@make keys.help
	@make terragrunt.help
	@make utils.help
	@make python.help
	@make yarn.help
	@make sops.help

## Create README.md by building it from README.yaml
readme:
	@gomplate --file $(README_TEMPLATE) \
		--out $(README_FILE)

setup:
	@echo "=====> install packages..."
	make python.setup
	make python.precommit
	@cp -rf provision/git/hooks/prepare-commit-msg .git/hooks/
	@[ -e ".env" ] || cp -rf .env.example .env
	make yarn.setup
	make git.setup
	@echo ${MESSAGE_HAPPY}

setup.sre: setup
	@echo "----> install packages for SRE..."
	make terragrunt.setup
	@echo ${MESSAGE_HAPPY}

environment:
	@echo "=====> loading virtualenv ${PYENV_NAME}..."
	make python.environment
	make keybase.environment
	make terragrunt.environment
	@echo ${MESSAGE_HAPPY}

.PHONY: clean
clean:
	@rm -f ./dist.zip
	@rm -fr ./vendor

# Show to-do items per file.
todo:
	@grep \
		--exclude-dir=vendor \
		--exclude-dir=node_modules \
		--exclude-dir=bin \
		--exclude=Makefile \
		--text \
		--color \
		-nRo -E ' TODO:.*|SkipNow|FIXMEE:.*' .
.PHONY: todo
