#!/bin/sh
# ------------------------------------------------------------------------------ 
# 1.
#
#
# 2.
#
#
# 3.
# ------------------------------------------------------------------------------ 


# ------------------------------------------------------------------------------ 
# Get the Root folder 
# ------------------------------------------------------------------------------ 

# go to the parent folder where the script got executed. 
cd "$(dirname "$0")/.."        
# set the parent folder as ROOT
DOTFILES_ROOT=$(pwd -P)
# load common funtions
source $DOTFILES_ROOT/install/common.sh 

# out a linebreak
echo ''  

info "------------------------------------------------------------"
info "DOTFILES_ROOT = $DOTFILES_ROOT"
info "------------------------------------------------------------"
success "dotfiles installation root folder found " 
