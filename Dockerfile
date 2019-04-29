FROM usgswma/python:debian-slim-stretch-python-3.6-24e21a7a7fc0ecea73ebfd36da71c320c3fb803d

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    gnupg

RUN apt-get install unzip

# Install AWS CLI
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -b ~/bin/aws
RUN echo ${PATH} | grep ~/bin
RUN export PATH=~/bin:${PATH}

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

ARG HUGO_BASEURL="http://localhost:1313"
ENV HUGO_BASEURL ${BUILD_COMMAND}

# The entrypoint script supports commands "build", "server", or pass-through to sh.
ENTRYPOINT ["/src/entrypoint.sh"]

CMD ["build"]

COPY . /public

#aws s3 cp anddi.jar s3://owi-common-resources/resources/application/anddi/artifacts/${TIER}/anddi.jar
RUN aws s3 sync ./public/ s3://labs.waterdata.usgs.gov
