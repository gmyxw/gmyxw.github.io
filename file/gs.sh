#!/bin/sh
str="";
count=0;
imgs=`ls *.gif | sort -n | tr " " "|"`;
for i in $imgs; do
    i=${i//'|'/' '}
    count=$(($count + 1));
    str="$str $count.pdf";
    convert -background white -alpha remove -alpha off "$i" "$i"
    mutool draw -F pdf -o $count.pdf "$i";
done
gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=final.pdf -dBATCH $str