#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

cd "$VIMHOME"
git pull
git submodule sync
git submodule update --init --recursive

echo "vimrc is updated successfully."
