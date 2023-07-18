#!/bin/bash


. ./clrconfig.sh
. ./parsinfo.sh
echo -e "\033[40m \033[37m"
if ! [ -n "$column1_background" ] && ! [ -n "$column1_font_color" ] && ! [ -n "$column2_background" ] && ! [ -n "$column2_font_color" ]
then
    echo -e "Column 1 background = default (${colors[default_column1_background]})"
    echo -e "Column 1 font color = default (${colors[default_column1_font_color]})"
    echo -e "Column 2 background = default (${colors[default_column2_background]})"
    echo -e "Column 2 font color = default (${colors[default_column2_font_color]})"
else
    if [ -n "$column1_background" ]
    then
        echo -e "Column 1 background = $column1_background (${colors[column1_background]})"
    else
        echo -e "Column 1 background = $default_column1_background (${colors[default_column1_background]})"
    fi
    if [ -n "$column1_font_color" ]
    then
        echo -e "Column 1 font color = $column1_font_color (${colors[column1_font_color]})"
    else
        echo -e "Column 1 font color = $default_column1_font_color (${colors[default_column1_font_color]})"
    fi
    if [ -n "$column2_background" ]
    then
        echo -e "Column 2 background = $column2_background (${colors[column2_background]})"
    else
        echo -e "Column 2 background = $default_column2_background (${colors[default_column2_background]})"
    fi
    if [ -n "$column2_font_color" ]
    then
        echo -e "Column 2 font color = $column2_font_color (${colors[column2_font_color]})\033[40m \033[37m"
    else
        echo -e "Column 2 font color = $default_column2_font_color (${colors[default_column2_font_color]})\033[40m \033[37m"
    fi
fi

