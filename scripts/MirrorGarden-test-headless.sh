#!/bin/bash
VERSION=`cat .DFX_VERSION`
export PATH=~/.cache/dfinity/versions/$VERSION:`pwd`:$PATH
dfx stop &&\
dfx start --background --clean &&\
dfx canister create MirrorGarden &&\
dfx build MirrorGarden &&\
dfx canister install MirrorGarden ||\
dfx canister install MirrorGarden --mode=reinstall &&\
echo "to do -- download and run ic-mt using some captured user input/output" &&\
mo-doc &&\
echo "Success!"
