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

# Copy the local working directory to the Docker image and set it as the working directory.
COPY . /src
WORKDIR /src

# Create the values needed to run Hugo and deploy the static site created to AWS
# Set the values as Docker build arguments 'ARG's
# Set these to the most commonly needed values.
# These values can be overwritten on the command line or by a Jenkins job.
#ARG HUGO_COMMAND="build"
#ARG DEPLOY_TIER="development"
#ARG AWS_SYNC="sync_no"

# The ARGs are only availble during the building of the Docker image and are not saved to the image
# We need these values in the image so the Jenkins job can use them.
# So, save the ARGs as 'ENV' variables that are accessable in the container.
#ENV ENV_HUGO_COMMAND=$HUGO_COMMAND
#ENV ENV_DEPLOY_TIER=$DEPLOY_TIER
#ENV ENV_AWS_SYNC=$AWS_SYNC

# Tell Docker where to find the scripts that will run Hugo, build the static site, and deploy that site to AWS.
# Tell Docker to use script as an entrypoint (i.e. run the script) when
# the Docker image is run to create the Docker container.
#ENTRYPOINT /src/buildDeploy.sh ${ENV_HUGO_COMMAND} ${ENV_DEPLOY_TIER} ${ENV_AWS_SYNC}
ENTRYPOINT ["/src/buildDeploy.sh"]
CMD ["build"]





