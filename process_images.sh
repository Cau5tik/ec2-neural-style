#!/bin/bash

if [ "${1}" == "" ]; then
    printf "Please supply a number of iterations as a parameter."
    exit 1;
fi

cd /home/ubuntu/neural-style

aws s3 sync s3://kiegan-is-my-bff-forever/content/ ./content
aws s3 sync s3://kiegan-is-my-bff-forever/style/ ./style

outputFolder="output-`date +%H-%m-%S`"

mkdir ${outputFolder}

for CONTENT in `ls content/`; do
    for STYLE in `ls style/`; do
        for X in 1 2 3 4 5 .. 9; do
            for Y in 1 2 3 4 5 .. 9; do
                for A in 1 2 3 4 5 .. 9; do
                    for B in 1 2 3 4 5 .. 9; do
                        th neural_style.lua -gpu 0 -style_image style/${STYLE}  -content_image content/${CONTENT} -backend cudnn \
                            -cudnn_autotune -num_iterations ${1} -content_weight "${X}e${Y}" -style_weight "${A}e${B}" \
                            -image_size 750 -output_image ${outputFolder}/"${STYLE}-${CONTENT}-${X}${Y}-${A}${B}.png"
                        aws s3 sync ${outputFolder}/ s3://kiegan-is-my-bff-forever/${outputFolder}/
                    done
                done
            done
        done
    done
done

