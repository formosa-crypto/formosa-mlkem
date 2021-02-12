#!/bin/bash
OS=$(uname -s)

if [ $OS == "Darwin" ]; then
    for i in `find . -perm +0111 -name "test_*"`; do
        echo $i
        ./$i
    done
else
    for i in `find . -executable -name "test_*"`; do
        echo $i
        ./$i
    done
fi
