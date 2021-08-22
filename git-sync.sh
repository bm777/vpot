#!/bin/bash


echo "________________________________"
git rm -rf --cached .
git add -A
git commit -am "Updated Vpot / $1"
git push
echo "Hi, bm7. A update has been done :)"
echo "____________________________________"
