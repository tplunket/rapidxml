#!/bin/bash

cd $(dirname $0)

function run_generate () {
    local GENERATOR="$1"
    local SOURCE_DIR="$2"
    if [[ $3 ]]
    then
        local CONFIG="-DCMAKE_BUILD_TYPE=$3"
    else
        local CONFIG=""
    fi
    cmake -G "${GENERATOR}" ${CONFIG} "${SOURCE_DIR}"
}

function run_build () {
    if [[ $1 ]]
    then
        local CONFIG="--config $1"
    else
        local CONFIG=""
    fi
    cmake --build . ${CONFIG}
}

function run_test () {
    if [[ $1 ]]
    then
        local CONFIG="-C $1"
    else
        local CONFIG=""
    fi

    # to run individual tests:
    # ctest -V -C Debug -R test_speed
    # -V: verbose output
    # -C: configuration
    # -R: regex for test(s) to run
    ctest ${CONFIG}
}

function build_xcode () {
    local OUTDIR="_out/xcode"
    local GENERATOR=Xcode
    local CONFIG=$1

    if ! [[ -d "$OUTDIR" ]]
    then
        mkdir -p "$OUTDIR"
    fi
    pushd "$OUTDIR"

    run_generate "${GENERATOR}" ../.. && run_build ${CONFIG} && run_test ${CONFIG}

    popd
}

function build_make () {
    local CONFIG=$1
    local OUTDIR="_out/make/$CONFIG"
    local GENERATOR="Unix Makefiles"

    if ! [[ -d "$OUTDIR" ]]
    then
        mkdir -p "$OUTDIR"
    fi
    pushd "$OUTDIR"

    run_generate "${GENERATOR}" ../../.. ${CONFIG} && run_build && run_test

    popd
}

if [[ `uname` == 'Darwin' ]]
then
    build_xcode Debug
    build_xcode Release
fi

build_make Debug
build_make Release

