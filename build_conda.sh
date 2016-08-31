#!/bin/sh

conda config --add channels ambermd
git clone https://github.com/amber-md/pytraj
(cd pytraj && git checkout . && git clean -fdx . && git checkout master && git fetch && git pull)

version=`(cd pytraj && git tag | tail -1)`
echo version $version

git clone https://github.com/Amber-MD/conda-recipes
cd conda-recipes
git clean -fdx .
git pull

echo "python pytraj/make_meta.py --version $version --release"
python pytraj/make_meta.py --version $version --release --libcpptraj-version 4.3.2
sh run_build.sh pytraj
