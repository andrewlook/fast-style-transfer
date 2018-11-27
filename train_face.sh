#!/bin/bash

IMAGES=$(pwd)/images

STYLE_IMG=$IMAGES/pastel_face.jpg
TEST_IMG=$IMAGES/real_sitting.jpg

mkdir -p /output/model
mkdir -p /output/test

python style.py --style $STYLE_IMG \
  --checkpoint-dir /output/model \
  --test $TEST_IMG \
  --test-dir /output/test \
  --content-weight 1.5e1 \
  --checkpoint-iterations 1000 \
  --batch-size 20