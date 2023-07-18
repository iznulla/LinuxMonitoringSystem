#!/bin/bash

ramtotal=$(awk '/MemTotal: /{print $2}' /proc/meminfo)
ramused=$(free | awk '/Mem: /{print $3}')
ramtconvert=$(echo "$ramtotal * 0.000001" | bc)
ramusconvert=$(echo "$ramused * 0.000001" | bc)
ramtrounded=$(printf "%.3f GB" $ramtconvert)
ramusrounded=$(printf "%.3f GB" $ramusconvert)


ramfree=$(free | awk '/Mem: /{print $4}')
ramfreeconvert=$(echo "$ramfree * 0.000001" | bc)
ramfreerounded=$(printf "%.3f GB" $ramfreeconvert)