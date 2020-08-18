#!/bin/sh

# 実行ディレクトリを取得
CURDIR=$(cd $(dirname $0); pwd)

for dotfile in ??*; do
    [ -f $dotfile ] && ln -snfv "$CURDIR"/"$dotfile" ~/."$dotfile"
done
