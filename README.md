# dotfiles

Clone the repos with

```
git clone --recurse-submodules -j8 git://github.com/iamkristian/dotfiles.git
```

Or after clone
```
 git submodule update --init
```

powerline
```
 git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

powerline fonts download
```
https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf
```
Set iterm2 font to source code pro

Down solarized patched for iterm2
```
https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors
```

Save the file and double click it and iterm will be patched

## Tmux

You will need to add

```
brew install reattach-to-user-namespace
```

To enable ``` ctrl-a ctrl-y/p ``` copy paste.

## Nvim

On mac do 

``` ln -s ~/code/dotfiles/.config # in ~ ```

On windows do

``` ln -s ~/code/dotfiles/.config/nvim # in ~/AppData/Local ```

And the Lazy plugin will load all of you plugins. Sweet!
