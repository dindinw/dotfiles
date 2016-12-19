# ------------------------------------------------------------------------------ 
# base output functions 
# ------------------------------------------------------------------------------ 
info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}
user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

install() {

    local dot_file="$1"
    local dot_file_link_to="$2"

	if [[ -e $dot_file_link_to ]]; then
		if [[ -e $dot_file ]]; then
			#orignal dot file exist. try to do a back up 
			if [[ ! -h $dot_file ]]; then
				#not a symbol link, copy it
				info "backup $dot_file ..."
				cp $dot_file $dot_file".orig"
			else
				link_file=`readlink -n $dot_file`
				# test if symbolic link has already been installed
				if [[ "$link_file" == "$dot_file_link_to" ]]; then
					info "$dot_file_link_to has already been linked to $dot_file"
					exit 0
				else
					fail "$dot_file has been linked to $link_file."
				fi
			fi
		fi
		ln -fs $dot_file_link_to $dot_file
		success "$dot_file has been linked to $dot_file_link_to succesfully!"
	else
		fail "$dot_file_link_to not found"
	fi
}

