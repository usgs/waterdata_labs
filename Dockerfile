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

RUN echo
# Install node.js from official package.
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y update
RUN apt-get install -y nodejs

COPY . /src
WORKDIR /src

ARG HUGO_BASEURL="http://labs.waterdata.usgs.gov"
ENV HUGO_BASEURL ${BUILD_COMMAND}
ARG BLAH
RUN echo $BLAH

# The entrypoint script supports commands "build", "server", or pass-through to sh.
ENTRYPOINT ["/src/entrypoint.sh ${BLAH}"]

CMD ["build"]

COPY . /public

RUN aws s3 sync /public/public s3://labs.waterdata.usgs.gov --delete
