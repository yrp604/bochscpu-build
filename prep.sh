#!/bin/sh

set -e
set -x

if [ -z "$BOCHS_REV" ]
then
    BOCHS_REV="HEAD"
fi

git clone https://github.com/bochs-emu/Bochs.git

cd Bochs

git reset --hard $BOCHS_REV

cp ../conf/.conf* bochs/
cp -r ../bochscpu bochs/instrument

git apply --ignore-whitespace ../patches/*.patch

rm -rf .git