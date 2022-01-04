#!/bin/bash

teeCmd="tee changeSnappyJava.log"
username=hdfs
nifiHome=/usr/local/nifi
chsjHome=$nifiHome/changeSnappyJava
echo start changeSnappyJava.sh | $teeCmd
date >> changeSnappyJava.log
sudo=sudo


snappyFileArr=($(find /usr/local/nifi/work -name "snappy*"))

for oldFile in ${snappyFileArr[@]};do
    path=$(echo $oldFile | sed "s/snappy.*//g")
    pathArr="$pathArr $path"

#backup old snappy
    echo "backup old snappy : $oldFile -> snappyJava_bkup" | $teeCmd
    $sudo chown $username:$username $oldFile
    cp $oldFile $chsjHome/snappyJava_bkup

#remove old snappy-java
    echo remove : $path >> ${chsjHome}/changeSnappyJava.log | $teeCmd
    $sudo rm $oldFile

#copy new snappy-java to pathes
    echo "copy new snappy-java : $path -> changeSnappyJava.log" | $teeCmd
    $sudo cp ${chsjHome}/snappy-java-1.1.8.2.jar $path
done

#echo "$pathArr" | $teeCmd 

