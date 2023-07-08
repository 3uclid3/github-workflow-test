#!/bin/bash

SHORT=t
LONG=target:,binutils:,gdb:,gcc
OPTS=$(getopt -a -n class --options $SHORT --longoptions $LONG -- "$@")

eval set -- "$OPTS"

TARGET=
BINUTILS_VERSION=
GDB_VERSION=
GCC_VERSION=
while true; do
  case "$1" in
    -t | --target ) TARGET="$1"; shift ;;
    --binutils ) BINUTILS_VERSION="$1"; shift ;;
    --gdb ) GDB_VERSION="$1"; shift ;;
    --gcc ) GCC_VERSION="$1"; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

echo "Building Cross-Compiler for $TARGET (binutils-$BINUTILS_VERSION gdb-$GDB_VERSION gcc-$GCC_VERSION)"

mkdir -p "/home/cross-compiler/$TARGET"

cat <<EOF > /home/cross-compiler/$TARGET/VERSION.txt
binutils-$BINUTILS_VERSION 
gdb-$GDB_VERSION 
gcc-$GCC_VERSION
EOF
