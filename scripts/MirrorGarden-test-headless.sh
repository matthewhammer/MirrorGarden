#!/bin/bash
VERSION=`cat .DFX_VERSION`
export PATH=~/.cache/dfinity/versions/$VERSION:`pwd`:$PATH
dfx stop &&\
dfx start --background --clean &&\
dfx canister create MirrorGarden &&\
dfx build MirrorGarden &&\
dfx canister install MirrorGarden ||\
dfx canister install MirrorGarden --mode=reinstall &&\
mo-doc &&\
tree docs &&\
ic-mt --help &&\
echo "to do -- run ic-mt on test vectors" &&\
echo "Success!"
