#!/bin/bash

#configure list
sudo=sudo
username=hdfs
nifiHome=/usr/local/nifi-1.15.2
chsjHome=$(cd $(dirname $0) && pwd)
teeCmd="tee -a ${chsjHome}/changeSnappyJava.log"

echo chsjHome : $chsjHome

echo start changeSnappyJava.sh | $teeCmd
date >> ${chsjHome}/changeSnappyJava.log
$sudo chown -R ${username}:${username} $nifiHome

snappyFileArr=($(find $nifiHome/work -name "snappy*"))

for oldFile in ${snappyFileArr[@]};do
    path=$(dirname $oldFile)
    pathArr="$pathArr $path"

#backup old snappy
    echo " - backup old snappy : $oldFile -> snappyJava_bkup" | $teeCmd
    cp $oldFile ${chsjHome}/snappyJava_bkup

#copy new snappy-java to pathes
    echo " - copy new snappy-java -> $path" | $teeCmd
    $sudo cp ${chsjHome}/snappy-java-1.1.8.2.jar $path

#remove old snappy-java
    echo " - remove : $oldFile " | $teeCmd
    $sudo rm $oldFile
done

#echo "$pathArr" | $teeCmd 

