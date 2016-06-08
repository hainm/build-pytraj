#!/bin/sh

git clone https://github.com/Amber-MD/conda-recipes
cd conda-recipes

version=`(cd pytraj && git tag | tail -1)`
python pytraj/make_meta.py --version $version --release
sh run_build.sh pytraj
