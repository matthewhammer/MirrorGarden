#!/bin/bash
VERSION=`cat .DFX_VERSION`
export PATH=~/.cache/dfinity/versions/$VERSION:`pwd`:$PATH
echo
echo Starting: Mirror Garden 2-user demo...using DFINITY SDK replica
echo
set -x
set -e
dfx stop
dfx start --no-artificial-delay --background --clean
dfx deploy --no-wallet MirrorGarden

ic-mt connect http://127.0.0.1:8000 `dfx canister id MirrorGarden` --user '("Alice", (100, 200, 200))' &
ic-mt connect http://127.0.0.1:8000 `dfx canister id MirrorGarden` --user '("Bob", (200, 100, 200))' &
echo
echo Mirror Garden 2-user demo, started.
echo
