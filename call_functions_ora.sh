#!/bin/bash

. File_Specifications_ora.sh

dir=~/informatica/SFTP/
filenm=FF_ORDER_METHOD
sftp_path=$dir$filenm*


for f in $sftp_path
do
if [ -f "$f"  ]
then 
echo "for $f file :"
File_PREFIX $1 $2 $f 
key1=$?
File_EXT $1 $2 $f
key2=$?
File_CL_CNT $1 $2 $f
key3=$?
File_DEL $1 $2 $f
key4=$?
File_CL $1 $2 $f
key5=$?

if [[ $key1 == 0 ||  $key2 == 0 || $key3 == 0 || $key4 == 0 || $key5 == 0 ]]
then
#mv $f ~/informatica/temp/
echo "$f moved to temp file is invalid !"
else
#mv $f ~/informatica/inbound/
echo "$f moved to inbound file is valid."
fi
else
echo "no files"
fi
done
