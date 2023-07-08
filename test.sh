#!/bin/bash

cd test

for d in *; do 
    if [ -d "$d" ]; then
        tar -czvf $d.tar.gz $d;
    fi
done
