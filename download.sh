#!/bin/sh

set -e

rm -rf install-tl-*
curl -L --output install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xf install-tl-unx.tar.gz
