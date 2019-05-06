FROM usgswma/python:debian-slim-stretch-python-3.6-24e21a7a7fc0ecea73ebfd36da71c320c3fb803d

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    gnupg

# Install Amazon Web Services Commmand Line Interface tool (awscli)
RUN pip install awscli

# Install Hugo from tar distribution to /usr/local/bin
ARG HUGO_VERSION="0.55.4"
RUN curl --silent --location https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz > hugo.tar.gz
RUN tar xzf hugo.tar.gz -C /usr/local/bin

# Install node.js from official package.
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y update
RUN apt-get install -y nodejs

COPY . /src
WORKDIR /src

ARG HUGO_COMMAND="build"
ARG DEPLOY_TIER="development"
ARG AWS_SYNC="sync_no"

ENV ENV_HUGO_COMMAND=$HUGO_COMMAND
ENV ENV_DEPLOY_TIER=$DEPLOY_TIER
ENV ENV_AWS_SYNC=$AWS_SYNC

COPY . /public

ENTRYPOINT /src/buildDeploy.sh ${ENV_HUGO_COMMAND} ${ENV_DEPLOY_TIER} ${ENV_AWS_SYNC}
#CMD ["sh", "-c", "$HUGO_COMMAND $DEPLOY_TIER $AWS_SYNC" ]