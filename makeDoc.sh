#!/bin/bash
# makeDoc.sh
# Turn a set of scanned JPG pages into a single document file.
# Requires the ImageMagick and Tesseract packages.
# Author: Fred Fury

echo "makeDoc.sh"
echo "Convert a set of scanned JPG pages into a single document file."
echo "Starting up..."
for i in {01..36}
do
echo "converting $i.JPG to $i.tif..."
bash -c "convert $i.JPG $i.tif"     # Convert the file to tesseract usable format
bash -c "tesseract $i.tif $i &>-"   # Convert the tif to txt
done
echo "Merging files into Output.doc"
bash -c "cat *.txt > Output.doc"        # Merge all the generated txt files into a single file
echo "Done."
