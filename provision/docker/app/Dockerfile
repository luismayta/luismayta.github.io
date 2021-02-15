FROM hadenlabs/hugo:0.80.0

ARG stage

LABEL NAME luismayta.github.io-app-$stage

ENV USERNAME developer

# set working directory to /src/
WORKDIR /src/

CMD ["hugo", "server", "--bind=0.0.0.0"]
