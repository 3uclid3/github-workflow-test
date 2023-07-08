#!/bin/bash

SHORT=t:, o
LONG=target:,output-dir:,binutils:,gdb:,gcc
OPTS=$(getopt -o $SHORT: --long $LONG: -- "$@")

eval set -- "$OPTS"

TARGET=
OUTPUT_DIR=
BINUTILS_VERSION=
GDB_VERSION=
GCC_VERSION=
while true; do
  case "$1" in
    -t | --target ) TARGET="$2"; shift 2 ;;
    -o | --output-dir ) OUTPUT_DIR="$2"; shift 2 ;;
    --binutils ) BINUTILS_VERSION="$2"; shift 2 ;;
    --gdb ) GDB_VERSION="$2"; shift 2 ;;
    --gcc ) GCC_VERSION="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

echo "Building Cross-Compiler for $TARGET (binutils-$BINUTILS_VERSION gdb-$GDB_VERSION gcc-$GCC_VERSION)"

mkdir -p "$OUTPUT_DIR/$TARGET"

cat <<EOF > $OUTPUT_DIR/$TARGET/VERSION.txt
binutils-$BINUTILS_VERSION 
gdb-$GDB_VERSION 
gcc-$GCC_VERSION
EOF
