#!/bin/sh

FILE1="filelist1.lst"
FILE2="filelist2.lst"

sed '1~2d' "$FILE1" > "${FILE1}.tmp" && mv "${FILE1}.tmp" "$FILE1"

sed '2~2d' "$FILE2" > "${FILE2}.tmp" && mv "${FILE2}.tmp" "$FILE2"