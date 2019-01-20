FROM labpositiva/latex:3.6.1
MAINTAINER Luis Mayta <@slovacus>

ARG stage
ARG version

LABEL NAME luismayta.github.io-doc
LABEL VERSION $version

COPY ./requirements/ /usr/src/requirements/
COPY ./requirements.txt /usr/src/requirements.txt
COPY ./docs/requirements.txt /usr/src/docs/requirements.txt

# set working directory to /usr/src
WORKDIR /usr/src

# Install sphinx dependences
RUN pip install -r /usr/src/requirements.txt \
    && pip install -r /usr/src/docs/requirements.txt
