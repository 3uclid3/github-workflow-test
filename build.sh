#!/bin/bash

#########################
# Args
target="x86_64-elf"

# target is overrideable
if ["$#" -eq 1 ]
    then target=$1
fi

echo "target=$target"

mkdir -p "/home/cross-compiler/$target"

cat <<EOF > target.txt
$target
EOF
