#!/bin/bash

if ! [[ -d _out/xcode ]]
then
    mkdir -p _out/xcode
fi

cd _out/xcode
cmake ../.. -G Xcode

