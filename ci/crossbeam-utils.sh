#!/bin/bash

cd "$(dirname "$0")"/../crossbeam-utils
set -ex

export RUSTFLAGS="-D warnings"

cargo check --no-default-features
cargo test

if [[ "$TRAVIS_RUST_VERSION" == "nightly" ]]; then
    cargo check --no-default-features --features nightly
    cargo test --features nightly
fi
