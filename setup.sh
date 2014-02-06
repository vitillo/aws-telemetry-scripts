#!/bin/bash

sudo apt-get install git zsh linux-tools python-dev
sudo pip install numpy
git clone --recursive https://github.com/vitillo/dotfiles.git && cd dotfiles && make && cd ..
sudo chsh ubuntu -s /bin/zsh
rm -rf ~/.vim/bundle/YouCompleteMe/

git clone https://github.com/mozilla/telemetry-server.git
git clone https://github.com/mreid-moz/s3funnel.git
(cd s3funnel && sudo python setup.py install)

sudo mkdir /mnt/telemetry
sudo chown ubuntu:ubuntu /mnt/telemetry
mkdir /mnt/telemetry/work

zsh
vim -c “BundleInstall”
