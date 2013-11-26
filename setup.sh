#!/bin/bash

sudo apt-get install git zsh
(git clone —recursive https://github.com/vitillo/dotfiles.git && cd dotfiles && make)
sudo chsh ubuntu -s /bin/zsh
rm -rf .vim/bundle/YouCompleteMe/

git clone https://github.com/mozilla/telemetry-server.git
git clone https://github.com/mreid-moz/s3funnel.git
(cd s3funnel && sudo python setup.py install)

sudo mkdir /mnt/telemetry
sudo chown ubuntu:ubuntu /mnt/telemetry
mkdir /mnt/telemetry/work

cd ~/telemetry-server
python -m mapreduce.job mapreduce/examples/osdistribution.py \
   --input-filter /path/to/filter.json \
   --num-mappers 16 \
   --num-reducers 4 \
   --data-dir /mnt/telemetry/work \
   --work-dir /mnt/telemetry/work \
   --output /mnt/telemetry/my_mapreduce_results.out \
   --bucket "telemetry-published-v1"

zsh
vim -c “BundleInstall”
