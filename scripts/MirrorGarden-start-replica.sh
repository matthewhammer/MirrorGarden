#!/bin/bash
VERSION=`cat .DFX_VERSION`
export PATH=~/.cache/dfinity/versions/$VERSION:`pwd`:$PATH
dfx stop &&\
dfx start --background --clean &&\
dfx canister create MirrorGarden &&\
dfx build MirrorGarden &&\
dfx canister install MirrorGarden ||\
dfx canister install MirrorGarden --mode=reinstall &&\
ic-gt -h &&\
ic-gt connect 127.0.0.1:8000 `dfx canister id MirrorGarden` --user '("Alice", (100, 255, 100))'

