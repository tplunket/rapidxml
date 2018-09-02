#!/bin/bash

if ! [[ -d _out/make ]]
then
    mkdir -p _out/make
fi

cd _out/make
cmake ../.. && make && ctest

