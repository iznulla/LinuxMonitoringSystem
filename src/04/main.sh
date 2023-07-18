#!/bin/bash


START=$(date +%s%N)

. ./scripts.sh
. ./converter.sh
if [ -n "$1" ]
then
    echo "Total number of folders (including all nested ones) = $countfolders"  
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    echo "$greatfold"
    echo "etc up to 5"
    echo "Total number of files = $totfile"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $file_conf" 
    echo "Text files = $file_text"  
    echo "Executable files = $file_exe"
    echo "Log files (with the extension .log) = $file_log"  
    echo "Archive files = $file_zip" 
    echo "Symbolic links = $file_link"

    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    for (( i = 0; i < $(cat logpathsize.txt | wc -l); i++ ))
    do
    echo "$i - ${psdir[$i]}, $(convert ${pssize[$i]}), ${psformat[$i]}"
    done
    echo "etc up to 10"

    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
    for (( i = 0; i < $(cat loghashinf.txt | wc -l); i++ ))
    do
    echo "$i - ${dhdir_name[$i]}, $(convert ${dhsize[$i]}), ${dhhash[$i]}"
    done
    echo "etc up to 10"
    rm loghashinf.txt logpathsize.txt
else
    echo "ERROR: few arguments"
fi

END=$(date +%s%N)
DIFF=$(($END - $START))
# DIFF=$(($DIFF/1000000/1000))
echo $DIFF | awk  '{printf ("Script execution time (in seconds) = %0.2f\n", $DIFF/1000000/1000)}'