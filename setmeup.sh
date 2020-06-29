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
