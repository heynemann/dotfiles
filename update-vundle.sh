#!/bin/sh

DIR=`pwd`
rm -rf /tmp/vundle
mkdir -p /tmp/vundle
cd /tmp/vundle
wget https://github.com/gmarik/vundle/archive/master.zip
mv master.zip vundle.zip
unzip vundle.zip
cd Vundle*
rm -rf $DIR/vim/.vim/autoload/vundle
cp -rf autoload doc $DIR/vim/.vim/
cd $DIR
