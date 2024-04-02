# UnicodeEngine
A project for creating unicode art.

## Creating art from the existing character set
```createArt.py```
Run to convert the specified image (e.g. lena.png) to unicode art and write output to art.txt

## Build Instructions for a new character set
1. ```getChars.py```
Run to write specified unicode characters to chars.txt.
2. ```charsToPng.html```
Update the value of _chars_ with the contents of chars.txt. Open in a browser and save the image. This produces an image of _chars_.
3. [sprite cutter](https://ezgif.com/sprite-cutter)
Chop up the saved image into tiles  (By number of columns / rows) and save the individual unzipped tiles in the chars folder.
4. ```sortDensities.py```
Update the value of _chars_ with the contents of chars.txt.
Run to sort the densities of the individual chars (tiles) and output a 256 character string.
5. ```createArt.py```
Update the value of _charMap_ with the 256 character string.
Run to convert the specified image to unicode art and write output to art.txt
6. ```art.txt```
Open in a web browser (chrome/edge recommended) to view final result (zoom out)