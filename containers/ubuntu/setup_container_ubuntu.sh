#!/bin/bash

# Any subsequent command which fails will exit the script
set -e

# Update / clean packages
apt-get update -y
apt-get upgrade -y
apt-get autoclean -y
apt-get autoremove -y

# Configure git
apt-get install -y git
git config --global user.name "Timothy Oei"
git config --global user.email "timothyoei.dev@gmail.com"

# Clone the devenv repository
git clone https://github.com/timothyoei/devenv.git

# Zsh
# apt-get -y install zsh

# Clean up
# rm setup_container_ubuntu.sh && rm -rf devenv