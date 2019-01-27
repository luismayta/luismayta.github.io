FROM hadenlabs/hugo:0.53

MAINTAINER Luis Mayta <@slovacus>

ARG stage
ARG version

LABEL NAME luismayta.github.io-app-$stage
LABEL VERSION $version

COPY ./requirements/ /usr/src/requirements/
COPY ./requirements.txt /usr/src/requirements.txt

# set working directory to /usr/src/
WORKDIR /usr/src/

# RUN pip install -r /usr/src/requirements/$stage.txt
