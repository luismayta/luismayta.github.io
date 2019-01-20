FROM python:3.6.4-alpine

MAINTAINER Luis Mayta <@slovacus>

ARG stage
ARG version

LABEL NAME luismayta.github.io-app-$stage
LABEL VERSION $version

COPY ./requirements/ /usr/src/requirements/
COPY ./requirements.txt /usr/src/requirements.txt

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN apk add --no-cache --update  gcc build-base bash && \
	pip install -r /usr/src/requirements/$stage.txt

