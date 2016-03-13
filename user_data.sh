#!/bin/bash

sudo chown -R ubuntu:ubuntu /home/ubuntu
cd /home/ubuntu
sudo mv * /mnt
sudo mv .[a-z]* /mnt
cd /home
sudo rm -rf ubuntu
sudo ln -s /mnt ubuntu

cd ec2-neural-style
chmod +x setup_neural-style.sh
chmod +x process_images.sh
chmod +x gpu_task.sh
~/ec2-neural-style/setup_neural-style.sh
