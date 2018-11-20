#!/usr/bin/env bash

pre=$1
after=$2

# echo $pre
# echo $after

if [ -z $pre ] || [ -z $after ]
then
    echo "缺少参数！"
    exit -1
fi

file_name=`ls *"$pre" 2> /dev/null`
# echo $data

if [ -z "$file_name" ]
then
    echo "找不到类似文件！"
    exit -1
fi

ls *"$pre" | while read LINE
do
    # echo $LINE
    data=`echo $LINE | sed -n "s/$pre/$after/gp"`
    # echo $data
    mv $LINE $data
done

if [ $? == 0 ]
then
    echo "修改成功！"
fi
