#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: ./gpu_task.sh <GPU#> <#iterations> <outputFolder>"
    exit 1;
fi


for CONTENT in `cat gpu${1}_content`; do
    for STYLE in `ls style/`; do
    mkdir ${3}
        for X in 1 2 3 4 5 .. 9; do
            for Y in 1 2 3 4 5 .. 9; do
                for A in 1 2 3 4 5 .. 9; do
                    for B in 1 2 3 4 5 .. 9; do
                        th neural_style.lua -gpu ${1} -style_image style/${STYLE}  -content_image content/${CONTENT} -backend cudnn \
                            -cudnn_autotune -num_iterations ${2} -content_weight "${X}e${Y}" -style_weight "${A}e${B}" \
                            -image_size 700 -output_image "${3}/${X}${Y}-${A}${B}.png"
                    done
                done
            done
        done
    tar -czvf "${CONTENT}-${STYLE}.tgz" ${3}
    aws s3 cp "${CONTENT}-${STYLE}.tgz" s3://kiegan-is-my-bff-forever/"${CONTENT}-${STYLE}.tgz"
    rm -rf ${3}
    rm -f "${CONTENT}-${STYLE}.tgz"
    done
done

