#!/bin/bash

for i in "$@"
do
case $i in
    -s=*|--source=*)
    SOURCE_FILE="${i#*=}"
    shift # past argument=value
    ;;
    -p=*|--password=*)
    PASSWORD="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
            # unknown option
    ;;
esac
done


echo "Unencrypting PDF file and generating PS file."
pdftops -upw $PASSWORD $SOURCE_FILE $HOME/unsecured.ps

echo "Generating PDF from PS file."
ps2pdf $HOME/unsecured.ps $HOME/unsecured.pdf

