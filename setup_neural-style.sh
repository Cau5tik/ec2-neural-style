#!/bin/bash

sudo chown -R ubuntu:ubuntu /home/ubuntu
sudo apt-get update
sudo apt-get install libprotobuf-dev protobuf-compiler -y
#curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-luajit+torch |  bash
#luarocks install loadcaffe

cd ~/
git clone https://github.com/szagoruyko/loadcaffe.git
cd loadcaffe
luarocks build loadcaffe-1.0-0.rockspec

cd ~/
git clone https://github.com/jcjohnson/neural-style.git
cd neural-style

sh models/download_models.sh

cd ~/ec2-neural-style/
mv gpu* ~/neural-style/
mv process_images.sh ~/neural-style/

~/neural-style/process_images.sh
