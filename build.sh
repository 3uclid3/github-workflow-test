#!/bin/bash

#########################
# Args
target="x86_64-elf"

# target is overrideable
if [[ ! -z "$1" ]]
then 
    target=$1
fi

echo "target=$target"

mkdir -p "/home/cross-compiler/$target"

cat <<EOF > "/home/cross-compiler/$target/target.txt"
$target
EOF
