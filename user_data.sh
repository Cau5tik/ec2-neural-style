#!/bin/bash

sudo apt-get update
sudo apt-get install git
git clone https://github.com/Cau5tik/ec2-neural-style.git
chmod +x ./ec2-neural-style/setup_neural-style.sh
./ec2-neural-style/setup_neural-style.sh
