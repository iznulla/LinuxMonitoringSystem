#!/bin/bash


roototal=$(df -t ext4 | awk '/mapper/{print $2}')
roototconvert=$(echo "$roototal * 0.000001" | bc)
roototrounded=$(printf "%.2f GB" $roototconvert)

rootused=$(df -t ext4 | awk '/mapper/{print $3}')
rootusedconvert=$(echo "$rootused * 0.000001" | bc)
rootusedrounded=$(printf "%.2f GB" $rootusedconvert)

rootfree=$(df -t ext4 | awk '/mapper/{print $4}')
rootfreeconvert=$(echo "$rootfree * 0.000001" | bc)
rootfreerounded=$(printf "%.2f GB" $rootfreeconvert)