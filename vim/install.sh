#!/bin/bash
# go to the parent folder where the script got executed. 
cd "$(dirname "$0")/.."        
# set the parent folder as ROOT
DOTFILES_ROOT=$(pwd -P)
# load common funtions
source $DOTFILES_ROOT"/install/common.sh"

dot_vimrc=~/.vimrc
vimrc=$DOTFILES_ROOT"/vim/vimrc.vim"

install $dot_vimrc $vimrc 

