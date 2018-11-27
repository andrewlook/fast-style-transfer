#!/bin/bash

IMAGES=$(pwd)/images

NAME=hands
STYLE_IMG=$IMAGES/pastel_$NAME.jpg
TEST_IMG=$IMAGES/real_sitting.jpg

mkdir -p /models/$NAME
mkdir -p /output/test/$NAME

CMD="python style.py --style $STYLE_IMG --checkpoint-dir /models/$NAME --test $TEST_IMG --test-dir /output/test/$NAME --content-weight 1.5e1 --checkpoint-iterations 1000 --batch-size 20 --train-path /images/train2014 --vgg-path /vgg/imagenet-vgg-verydeep-19.mat"

floyd run \
    --gpu \
    --env tensorflow-1.5 \
    --data narenst/datasets/coco-train-2014/1:images \
    --data narenst/datasets/neural-style-transfer-pre-trained-models/1:models \
    --data floydhub/datasets/imagenet-vgg-verydeep-19/3:vgg \
    "$CMD"