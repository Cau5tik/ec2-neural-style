#!/bin/bash

cd /home/ubuntu
sudo mv * /mnt
sudo mv .[a-z]* /mnt
cd /home
sudo rm -rf ubuntu
sudo ln -s /mnt ubuntu
sudo chown ubuntu:ubuntu /mnt


cd ~/ec2-neural-style
chmod +x *.sh
~/ec2-neural-style/setup_neural-style.sh
