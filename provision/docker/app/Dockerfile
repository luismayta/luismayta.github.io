FROM hadenlabs/hugo:0.53

MAINTAINER Luis Mayta <@slovacus>

ARG stage

LABEL NAME luismayta.github.io-app-$stage

COPY ./requirements/ /usr/src/requirements/
COPY ./requirements.txt /usr/src/requirements.txt

# set working directory to /usr/src/
WORKDIR /usr/src/
