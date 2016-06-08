#!/bin/sh

version=`(cd pytraj && git tag | tail -1)`
echo version $version

git clone https://github.com/Amber-MD/conda-recipes
cd conda-recipes
git pull

python pytraj/make_meta.py --version $version --release
sh run_build.sh pytraj
