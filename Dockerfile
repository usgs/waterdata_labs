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

# Set deployment the development tier to a selection set in Jenkins or on the commmand line as a --build-arg
ARG DEPLOY_TIER="deployment"

#ARG HUGO_BASEURL
#ENV HUGO_BASEURL ${BUILD_COMMAND}
#CMD ["build"]
ARG HUGO_COMMAND="build"

#ENV HUGO_COMMAND="build"

COPY . /public

ENTRYPOINT "/src/buildDeploy.sh ${HUGO_COMMAND} ${DEPLOY_TIER}"
