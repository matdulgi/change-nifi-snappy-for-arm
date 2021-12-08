#!/bin/bash

snappyFileArr=$(find /usr/local/nifi -name "*snappy-java*")
nappyPathArr=$(find /usr/local/nifi -name "*snappy-java*" | sed 's/snappy.\+$//g')
#echo $snappyFileArr
    
echo $snappyPathArr
