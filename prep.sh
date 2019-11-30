#!/bin/sh

set -e
set -x

if [ -z "$BOCHS_REV" ]
then
    BOCHS_REV="HEAD"
fi

svn checkout \
    --revision $BOCHS_REV \
    http://svn.code.sf.net/p/bochs/code/trunk/bochs \
    bochs

cp conf/.conf* bochs/
cp -r bochscpu bochs/instrument

git apply --ignore-whitespace patches/*.patch

rm -rf bochs/.svn
