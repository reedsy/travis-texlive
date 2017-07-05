#!/bin/sh

set -e

rm -rf install-tl-*
wget http://ftp.uni-erlangen.de/ctan/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xf install-tl-unx.tar.gz
