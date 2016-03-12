#!/bin/bash

cd /home/ubuntu/neural-style

aws s3 sync s3://kiegan-is-my-bff-forever/content/ ./content
aws s3 sync s3://kiegan-is-my-bff-forever/style/ ./style

outputFolder="output-`date +%H-%m-%S`"

mkdir ${outputFolder}

~/neural-style/gpu_task.sh 0 500 ${outputFolder} &
#~/neural-style/gpu_task.sh 1 500 ${outputFolder} &
#~/neural-style/gpu_task.sh 2 500 ${outputFolder} &
#~/neural-style/gpu_task.sh 3 500 ${outputFolder} &

while [ `ps aux | grep gpu_task.sh | wc --lines` > 1 ]; do
    sleep 10
done

echo "Finished"
