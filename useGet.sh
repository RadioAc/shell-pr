#!/bin/bash

function func () {
    echo "func"
}

echo -e "参数1:$1  参数2:$2  参数3:$3"

while getopts a:b:c: OPT
do
    case $OPT in
        a) parmasA="$OPTARG";;
        b) parmasB="$OPTARG";;
        c) parmasC="$OPTARG";;
        h) func;;
        ?) func;;
    esac
done

echo "参数a:${parmasA}  参数b:${parmasA}  参数c:${parmasC}"