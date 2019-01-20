#!/bin/sh

set -e

PWD=`pwd`

cd $HOME
mkdir .fonts
cd .fonts
wget https://download.damieng.com/fonts/original/EnvyCodeR-PR7.zip
unzip EnvyCodeR-PR7.zip
rm EnvyCodeR-PR7.zip
cd $PWD
