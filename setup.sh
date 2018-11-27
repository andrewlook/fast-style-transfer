cd /output
curl -O http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
curl -O http://msvocds.blob.core.windows.net/coco2014/train2014.zip
unzip train2014.zip

mkdir ~/data
mv imagenet-vgg-verydeep-19.mat ~/data
mv train2014 ~/data