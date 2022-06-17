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
  git clone --depth=1 https://github.com/ervandew/supertab.git ~/.vim/pack/plugins/start/supertab
  git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
  git clone --depth=1 https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
  git clone --depth=1 https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/dist/start/vim-airline-themes
  git clone --depth=1 https://github.com/tpope/vim-endwise.git ~/.vim/pack/plugins/start/endwise
  git clone --depth=1 https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/fugitive 
  git clone --depth=1 https://github.com/tpope/vim-surround.git ~/.vim/pack/plugins/start/surround
fi
