#!/bin/sh
# go to the parent folder where the script got executed. 
cd "$(dirname "$0")/.."        
# set the parent folder as ROOT
DOTFILES_ROOT=$(pwd -P)
# load common funtions
source $DOTFILES_ROOT/install/common.sh 
echo 'test echo'  
info "test info"
success "test success" 
user "test user"
fail "test wrong"
