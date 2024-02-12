#!/bin/bash

# Any subsequent command which fails will exit the script
set -e

# Add sudo if it's not available
if ! command -v sudo &> /dev/null; then
  apt-get update -y
  apt-get install -y sudo
fi

# Update / clean packages
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoclean -y
sudo apt-get autoremove -y

# Configure git
sudo apt-get install -y git
git config --global user.name "Timothy Oei"
git config --global user.email "timothyoei.dev@gmail.com"

git clone https://github.com/timothyoei/devenv.git

# Zsh
sudo apt-get -y install zsh

# Clean up
rm setup_ubuntu.sh && rm -rf devenv