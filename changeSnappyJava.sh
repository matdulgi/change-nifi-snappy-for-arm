#!/bin/bash

teeCmd="tee changeSnappyJava.log"
echo start changeSnappyJava.sh | $teeCmd
date >> changeSnappyJava.log


snappyFileArr=($(find /usr/local/nifi/work -name "snappy*"))

for oldFile in ${snappyFileArr[@]};do
    path=$(echo $oldFile | sed "s/snappy.*//g")
    pathArr="$pathArr $path"

#backup old snappy
    echo "backup old snappy : $oldFile -> snappyJava_bkup" | $teeCmd
    cp $oldFile snappyJava_bkup

#remove old snappy-java
    echo remove : $path >> changeSnappyJava.log | $teeCmd
    rm $oldFile

#copy new snappy-java to pathes
    echo "copy new snappy-java : $path -> changeSnappyJava.log" | $teeCmd
    cp snappy-java-1.1.8.2.jar $path
done

#echo "$pathArr" | $teeCmd 

