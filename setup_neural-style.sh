#!/bin/bash

sudo apt-get install libprotobuf-dev protobuf-compiler -y
curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-luajit+torch | bash
luarocks install loadcaffe

cd ~/
git clone https://github.com/jcjohnson/neural-style.git
cd neural-style

sh models/download_models.sh
