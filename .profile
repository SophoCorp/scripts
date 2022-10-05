# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# prompt

#smiley() {
#	if[ "$?" == "0" ]; then
#		echo -e '\e[0;32m😊'
#	fi
#}
git_icon() {
	printf ' \uf7a1 '
}

node_icon() {
	printf ' \uf898 '
}

git_parse_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
prompt_icon() {
	printf ' \ue285 '
} 

git_info() {
	if [[ $(git_parse_branch) ]]; then
		git_icon
		git_parse_branch
	fi
}


node_info() {
	local nv
	nv=$(node -v)
	test -n "$nv" && printf %s "$(node_icon)$nv" || :
}


export PS1='
`if [[ $? -gt 0 ]]; then printf "\e[0;31m[\e[0m\e[38;5;172m😡"; else printf "\e[0;31m[\e[0m\e[38;5;172m😊"; fi`\u\e[0m \W\e[0;36m \@\e[0m\e[0;31m]\e[38;5;172m$(git_info)\e[38;5;76m$(node_info)\e[0m\n$ '
cat<<'EOF'
           _..._
         .'     '.
        /  _   _  \
        | (o)_(o) |
         \(     ) /
         //'._.'\ \
        //   .   \ \
       ||   .     \ \
       |\   :     / |
       \ `) '   (`  /_
     _)``".____,.'"` (_
     )     )'--'(     (
      '---`      `---`
EOF

# aliase
alias l="ls -l"
alias la="ls -la"
alias ll="ls -ll"
alias lh="ls -lh"

# NodeJS
VERSION=v16.17.1
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH

