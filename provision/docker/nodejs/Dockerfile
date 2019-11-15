FROM node:10.16.3-slim

ARG stage

LABEL NAME luismayta.github.io-node-$stage

ENV PACKAGES bash \
  curl \
  git

WORKDIR /usr/src/

COPY package.json yarn.lock /usr/src/

RUN apt-get update -y \
  && apt-get install -y ${PACKAGES} --no-install-recommends \

# add our user and group
  && groupadd -g 500 -r nodejs \
  && groupadd developer \
  && useradd -m -g developer -G nodejs developer \
  && chown -R developer:nodejs /usr/local/bin \
  && mkdir -p /usr/src \
  && chown -R developer /usr/src \

# install yarn
  && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash \
  && apt-get clean \
  && apt-get autoremove \
  && yarn global add react concurrently
