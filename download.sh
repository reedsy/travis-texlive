#!/bin/sh

set -e

rm -rf install-tl-*
wget http://ctan.mirrors.hoobly.com/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xf install-tl-unx.tar.gz
