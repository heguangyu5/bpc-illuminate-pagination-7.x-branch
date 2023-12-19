#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Illuminate/Pagination/
mkdir ./Illuminate/Pagination/

echo "placeholder-pagination.php" > ./Illuminate/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo "Pagination/$i" >> ./Illuminate/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Illuminate/Pagination/$i
        else
            echo "cp       $i"
            cp $i ./Illuminate/Pagination/$i
        fi
    fi
done
cp bpc.conf Makefile ./Illuminate/
