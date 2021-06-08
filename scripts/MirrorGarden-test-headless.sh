#!/bin/bash
VERSION=`cat .DFX_VERSION`
export PATH=~/.cache/dfinity/versions/$VERSION:`pwd`:$PATH
set -e
set -x
dfx start --background
dfx deploy --no-wallet MirrorGarden
ic-mt --help
echo "to do -- run ic-mt on test vectors"
echo "Success!"
