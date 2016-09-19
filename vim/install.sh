#!/bin/bash
# go to the parent folder where the script got executed. 
cd "$(dirname "$0")/.."        
# set the parent folder as ROOT
DOTFILES_ROOT=$(pwd -P)
# load common funtions
source $DOTFILES_ROOT"/install/common.sh"

base_dir=$DOTFILES_ROOT"/vim"
dot_vimrc=~/.vimrc
vimrc=$base_dir"/vimrc.vim"

if [[ -e $vimrc ]]; then
	if [[ -e $dot_vimrc ]]; then
		#orignal .vimrc file exist. try to do a back up 
		if [[ ! -h $dot_vimrc ]]; then
			#not a symbol link, copy it
			info "backup $dot_vimrc ..."
		    cp $dot_vimrc $dot_vimrc".orig"
		else
			link_file=`readlink -n $dot_vimrc`
			# test if symbolic link has already been installed
			if [[ "$link_file" == "$vimrc" ]]; then
				info "$vimrc has already been linked to $dot_vimrc"
				exit 0
			else
				fail "$dot_vimrc has been linked to $link_file."
			fi
		fi
	fi
	ln -fs $vimrc $dot_vimrc
	success "$dot_vimrc has been linked to $vimrc succesfully!"
else
	fail "$vimrc not found"
fi
