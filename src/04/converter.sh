#!/bin/bash

convert(){
    local size=$1
    if [ -n "$size" ]
    then
        if [ $size -lt 1024 ]; then
            echo "$1 b"
        elif [ $size -ge 1024 ] && [ $size -lt 1048576 ]; then
            echo $size | awk '{printf ("%.2f Kb/n", $1/1024)}'
        elif [ $size -ge 1048576 ] && [ $size -lt 1073741824 ]; then
            echo $size | awk '{printf ("%.2f Mb/n", $1/1024/1024)}'
        elif [ $size -ge 1073741824 ]; then
            echo $size | awk '{printf ("%.2f Gb/n", $1/1024/1024/1024)}'
        fi
    else
        echo "unknow file name and size"
    fi
}

declare -x -f convert
