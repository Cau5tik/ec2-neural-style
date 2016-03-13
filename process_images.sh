#!/bin/bash

ITERATIONS=700

cd /home/ubuntu/neural-style

export LD_LIBRARY_PATH=`cat LD_LIBRARY_PATH`

aws s3 sync s3://kiegan-is-my-bff-forever/content/ ./content
aws s3 sync s3://kiegan-is-my-bff-forever/style/ ./style

~/neural-style/gpu_task.sh 0 $ITERATIONS "gpu0" &
~/neural-style/gpu_task.sh 1 $ITERATIONS "gpu1" &
~/neural-style/gpu_task.sh 2 $ITERATIONS "gpu2" &
~/neural-style/gpu_task.sh 3 $ITERATIONS "gpu3" &

while [ `ps aux | grep gpu_task.sh | wc --lines` != "1" ]; do
    sleep 10
done

sudo shutdown -h now
