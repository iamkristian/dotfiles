#!/bin/bash

plugins=( edkolev/tmuxline.vim.git \
  preservim/vim-markdown.git \
  preservim/vimux.git \
  mileszs/ack.vim.git \
  vim-ruby/vim-ruby.git \
  tpope/vim-rails.git \
  sickill/vim-pasta.git \
  pangloss/vim-javascript.git \
  MaxMEllon/vim-jsx-pretty.git \
  mattn/emmet-vim.git \
  tpope/vim-surround.git \
  elixir-editors/vim-elixir.git
)

for plugin in "${plugins[@]}"
do
  echo "--------------- plugin: ${plugin} ---------------"
  git clone https://github.com/${plugin}
done
