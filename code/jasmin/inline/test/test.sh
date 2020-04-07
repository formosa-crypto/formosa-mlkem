#!/bin/bash

for i in `find . -executable -name "test_*"`; do
  echo $i
  ./$i
done
