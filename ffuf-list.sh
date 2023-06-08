#!/bin/bash

mkdir .ffuf
for line in $(cat $1) ; do
    ffuf -u "$line/FUZZ" -w <wordlist> -mc 200 -of csv -o .ffuf/$RANDOM.txt
done

cat .ffuf/* | sort -u > ffuf.csv
