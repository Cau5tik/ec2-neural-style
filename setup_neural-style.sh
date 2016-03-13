#!/bin/bash

sudo apt-get update
sudo apt-get install libprotobuf-dev protobuf-compiler -y
#curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-luajit+torch |  bash

cd ~/
git clone https://github.com/szagoruyko/loadcaffe.git
cd loadcaffe
sudo chown -R ubuntu:ubuntu ~/torch/
luarocks build loadcaffe-1.0-0.rockspec
sudo chown -R root:root ~/torch/

cd ~/
git clone https://github.com/jcjohnson/neural-style.git
cd neural-style

sh models/download_models.sh

cd ~/ec2-neural-style/
mv gpu* ~/neural-style/
mv process_images.sh ~/neural-style/

