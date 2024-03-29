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

# Clone the devenvs repository
git clone https://github.com/timothyoei/devenvs.git

# Setup cli
apt-get install -y \
  zsh \
  neovim \
  curl \
  bat \
  fd-find

# Customize zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cat devenvs/common/.zshrc > ~/.zshrc

# Clean up
rm setup_container_ubuntu.sh && rm -rf devenvs