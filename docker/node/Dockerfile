# Set the base image to Ubuntu
FROM ubuntu:20.04

#FOR DEBUGGING
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install curl gnupg -yq

# Install Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential
RUN apt-get install python2 -y
RUN apt-get install libpng-dev -y --no-install-recommends

# dh-autoreconf should be install after container start
# RUN apt-get install dh-autoreconf -y

# Set up ZSH and our preferred terminal environment for containers
RUN apt-get install zsh -y && apt-get install curl -y && apt-get install git -y

RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" ||true

RUN ln -f /bin/zsh /bin/sh

# Cleanup
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y