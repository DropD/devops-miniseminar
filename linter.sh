#!/bin/bash
mkdir tmp
for i in *.f95
do
    gfortran --free-form -fsyntax-only $i -J tmp &>/dev/null &
    wait $(jobs -l | grep gfortran | awk -F '[][]' '{print "%" $2}')
done 
gfortran --free-form -fsyntax-only $1 -J tmp
rm -R tmp
