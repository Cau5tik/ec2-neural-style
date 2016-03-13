#!/bin/bash

sudo apt-get update
git clone https://github.com/Cau5tik/ec2-neural-style.git
cd ec2-neural-style
chmod +x setup_neural-style.sh
chmod +x process_images.sh
chmod +x gpu_task.sh
~/ec2-neural-style/setup_neural-style.sh
