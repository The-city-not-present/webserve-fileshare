#!/usr/bin/env bash
set -e


echo "Changing path to front and calling build..."
pushd src_webapp/fileshare
npm run build
popd
echo "done"
echo -
echo -
