#!/bin/bash

for i in `find . -executable -name "test_poly*"`; do
  echo $i
  ./$i
done
