#!/bin/bash

mkdir battlefield
touch battlefield/knight.txt battlefield/sorcerer.txt battlefield/rogue.txt

if [ -f "battlefield/knight.txt" ]
then
    mkdir archive
    mv battlefield/knight.txt archive/

    ls battlefield
    ls archive
fi