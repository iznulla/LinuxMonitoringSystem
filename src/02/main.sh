#!/bin/bash



if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]
then
    if [[ $1 =~ ^[1-6]+$ ]] && [[ $2 =~ ^[1-6]+$ ]] && [[ $3 =~ ^[1-6]+$ ]] && [[ $4 =~ ^[1-6]+$ ]]
    then
        if [ $1 -ne $2 ] && [ $3 -ne $4 ]
        then
            ./parsinfo.sh $1 $2 $3 $4
        else
            echo "column options is equal"
            echo "do you want to retry?(y/n)"
            read quest
            if [ ${quest^^} = "Y" ]
            then
                echo "Enter just args"
                read a b c d
                ./main.sh $a $b $c $d
            else
                echo "exit with code 0"
            fi
        fi
    else
        echo "some argument is greater than 6"
    fi
else
echo "arguments must be numeric and more then four"
fi