#!/bin/bash

sudo=sudo
username=hdfs
nifiHome=/usr/local/nifi-1.15.2
chsjHome=$(cd $(dirname $0) && pwd)
teeCmd="tee -a ${chsjHome}/removeSnappyJava.log"

snappyFileArr=($(find $nifiHome/work -name "snappy-java-1.1.8.2.jar"))



for snappyFile in ${snappyFileArr[@]};do
    echo $snappyFile
    echo " - remove : $snappyFile " | $teeCmd
    $sudo rm $snappyFile
done
