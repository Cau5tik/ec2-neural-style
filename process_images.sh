#!/bin/bash

cd /home/ubuntu/neural-style

aws s3 sync s3://kiegan-is-my-bff-forever/content/ ./content
aws s3 sync s3://kiegan-is-my-bff-forever/style/ ./style

~/neural-style/gpu_task.sh 0 1000 "gpu0" &
~/neural-style/gpu_task.sh 1 1000 "gpu1" &
~/neural-style/gpu_task.sh 2 1000 "gpu2" &
~/neural-style/gpu_task.sh 3 1000 "gpu3" &

while [ `ps aux | grep gpu_task.sh | wc --lines` != "1" ]; do
    sleep 10
done

sudo shutdown -h now
