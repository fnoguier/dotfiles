#! /bin/bash

#default options
alias ls='ls --color=always --group-directories-first'

alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias less='less -R'

# Utilities
alias ll='ls -alF'
alias lll='ll | less'
alias la='ls -A'
alias l='ls -CF'
alias lt='ll -t | head'

alias timestamp='date -u +%Y%m%d%H%M%S'

alias git_switch_back='[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ] && git switch "$(git reflog | grep '"'"'moving from'"'"' | head -n 1 | cut -d '"' '"' -f 6)"'
alias ä=git_switch_back
alias äm='git switch master'

function find_and_grep {
	if [ -n "$1" ]; then
	      	FNAME="$1"
		shift
	fi
	if [ -n "$1" ]; then 
		GREP_ARG="$1"
	else
		GREP_ARG="$FNAME"
		FNAME="*"
	fi
	echo "find '$GREP_ARG' in files '$FNAME' under current directory" >&2
	if [ -n "$GREP_ARG" ]; then 
		grep -nRHI --color=always --include="$FNAME" "$GREP_ARG" 
	fi
}

alias frep='find_and_grep'

# sdkman shortcut
alias java8='sdk use java 8.0.222.hs-adpt'
alias java11='sdk use java 11.0.5.hs-adpt'
alias java12='sdk use java 12.0.2.hs-adpt'

# edit shortcuts
alias é='vim'
function vim_and_source {
	test -n "$1" && é "$1" && source "$1"
}
function note_title {
	head "$1" -n 1 | cut -c -50 | tr -c '[:alnum:]._-' '_' | sed -r 's/_*$//g'
}
function note_new {
	TS="note.$(timestamp)"
	é "$TS" && mv "$TS" "$HOME/Documents/notes/$(note_title $TS)"
}
alias én='note_new'
alias è='vim_and_source'
alias èbashrc='vim_and_source ~/.bashrc'
alias èalias='vim_and_source ~/.bash_aliases'

#Fix touchpad two finger scroll after suspend
alias fix2fs='sudo modprobe -r psmouse && sudo modprobe psmouse'
# directories shortcuts
function cd_in_home {
 test -n "$1" && cd "$HOME/$1" || cd "$HOME" || return
}

alias à='cd_in_home'
alias àd='à dvlp'
alias àda='à dvlp/ngAuth'
alias àde='à dvlp/ngEvents'
alias àdi='à dvlp/ngIntegration'
alias àdin='à dvlp/ngIntegration/ngVirtualBoxREST'
alias àdiv='à dvlp/ngIntegration/vagrant'
alias àdp='à dvlp/ngPollingSystem'
alias àds='à dvlp/ngScreener/'
alias àdsb='à dvlp/ngScreener/ngBrowser'
alias àdsbf='à dvlp/ngScreener/ngBrowser/frontend'
alias àdsbb='à dvlp/ngScreener/ngBrowser/back'

alias àfd='à frno/dotfiles'

alias àn='à Documents/notes'
