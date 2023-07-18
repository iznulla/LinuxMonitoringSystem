#!/bin/bash


. ./converter.sh

countfolders=$(find $1 -type d | wc -l)
greatfold=$(find $1 -type d -exec du -sh {} \; | sort -n -r | awk '//{printf NR" - "$2" "$1"\n"}' | head -5)

totfile=$(find $1 -type f | wc -l)
file_conf=$(find $1 -type f -iname "*.conf" | wc -l)
file_text=$(find $1 -type f -iname "*.txt" | wc -l)
file_exe=$(find $1 -perm /a=x -type f | wc -l)
file_log=$(find $1 -type f -iname "*.log" | wc -l)
file_zip=$(find $1 -type f -iname "*.zip" -o -iname "*.tar.gz" -o -iname "*.tar" -o -iname "*.tgz" -o -iname "*.bz2"| wc -l)
file_link=$(find -L $1 -xtype l | wc -l)

pathandsize=($(find $1 -type f -ls | sort -r -n -k7 | head -10 | awk -F[.] '"[a-z]" {printf NR" - "$0" "$(NF)"\n"}' | sed 's/~/ /g' > logpathsize.txt))

psdir=($(awk '{printf $13"\n"}' logpathsize.txt))
pssize=($(awk '{printf $9"\n"}' logpathsize.txt))
psformat=($(awk '{printf $(NF)"\n"}' logpathsize.txt))

dir_hash=($(find $1 -perm /a=x -type f -ls | sort -r -n -k7 | head -10 | awk '//{printf $(NF)"\n"}' | xargs md5sum > loghashinf.txt))
dhhash=($(awk '{printf $1"\n"}' loghashinf.txt))
dhdir_name=($(awk '{printf $2"\n"}' loghashinf.txt))
dhsize=($(find $1 -executable -type f -ls | sort -r -n -k7 | head -10 | awk '{printf $7"\n"}'))



