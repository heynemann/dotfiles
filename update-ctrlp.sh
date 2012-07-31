#!/bin/sh

DIR=`pwd`
rm -rf /tmp/ctrlp
mkdir -p /tmp/ctrlp
cd /tmp/ctrlp
wget http://github.com/kien/ctrlp.vim/tarball/master
mv master ctrlp.tar.gz
tar -xzvf ctrlp.tar.gz
cd kien-ctrlp.vim*
cp -rf autoload doc plugin $DIR/vim/.vim/
cd $DIR
