#!/bin/bash

sudo apt-get update
sudo apt-get install git
git clone https://github.com/Cau5tik/ec2-neural-style.git
cd ec2-neural-style
chmod +x setup_neural-style.sh
chmod +x process_images.sh
chmod +x gpu_task.sh
sudo ~/ec2-neural-style/setup_neural-style.sh
