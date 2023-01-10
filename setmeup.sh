#!/bin/bash
shopt -s extglob nullglob
for f in .*; do
if [ $f = "." ]; then continue; fi
if [ $f = ".." ]; then continue; fi
if [ $f = ".git" ]; then continue; fi
if [ $f = ".gitignore" ]; then continue; fi
if [ -f "~/$f" ]; then
    echo "$f exist";
else
  echo "$f does not exist - linking"
  file="`pwd`/$f"
  echo "$file"
  ln -s $file ~/$f
fi
done
BIN=bin
if [ -f "~/$BIN" ]; then
    echo "$BIN exist"
else
  echo "$BIN does not exist - linking"
  file="`pwd`/$BIN"
  echo "$file"
  ln -s $file ~/$BIN
fi

VIM=.vim/pack/plugins/start
if [ -f "~/$VIM" ]; then
    echo "$VIM exist"
else
  echo "$VIM does not exist - creating"
  mkdir -p ~/$VIM
  echo "You can run $VIM/bundle/plugins.sh to install your plugins"
fi
