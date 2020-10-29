#! /bin/bash

#default options
alias ls='ls --color=always --group-directories-first --classify'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'

alias less='less -R'

# Utilities & shortcuts
alias l='ls -C'
alias ll='ls -l'
alias lll='ls -l | less'
alias a='ls -AC'
alias la='ls -Al'
alias lal='ls -Al | less'
alias h='ls -AC --directory  .*'
alias lh='ls -Al --directory  .*'
alias lhl='ls -Al --directory  .* | less'
alias lt='la -t | head'

alias timestamp='date -u +%Y%m%d%H%M%S'

function find_and_grep {
	if [[ -n "$1" ]]; then
	      	FNAME="$1"
		shift
	fi
	if [[ -n "$1" ]]; then
		GREP_ARG="$1"
	else
		GREP_ARG="$FNAME"
		FNAME="*"
	fi
	echo "find '$GREP_ARG' in files '$FNAME' under current directory" >&2
	if [[ -n "$GREP_ARG" ]]; then
		grep -nRHI --color=always --include="$FNAME" "$GREP_ARG"
	fi
}; alias frep='find_and_grep'

function sed_remove_trailing_whitespaces {
	# take a file name as 1st argument
	sed -i -E 's/[[:space:]]+$//' $1
}

# sdkman shortcut
alias java8='sdk use java 8.0.222.hs-adpt'
alias java11='sdk use java 11.0.5.hs-adpt'
alias java12='sdk use java 12.0.2.hs-adpt'

# edit shortcuts
alias é='vim'

function edit_and_source {
	test -n "$1" && é "$1" && source "$1"
}; alias è='edit_and_source'

alias èbashrc='è ~/.bashrc'
alias èalias='è ~/.bash_aliases'

function note_title {
	head "$1" -n 1 | cut -c -50 | tr -c '[:alnum:]._-' '_' | sed -r 's/_*$//g'
}

function note_new {
	TS="note.$(timestamp)"
	é "$TS" && mv "$TS" "$HOME/Dropbox/ngnotes/$(note_title $TS)"
}; alias én='note_new'

#Fix touchpad two finger scroll after suspend
alias fix2fs='sudo modprobe -r psmouse && sudo modprobe psmouse'

# attach to an existing tmux session or create a new one
function attach_or_create_tmux_session {
	if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
		tmux -2 attach -t default || tmux -2 new -s default
	fi
}; alias tm='attach_or_create_tmux_session'

# directories navigation shortcuts
alias .1='cd ../'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'
alias ..='.1'
alias ...='.2'
alias ....='.3'

# directories shortcuts
function cd_in_home {
 test -n "$1" && cd "$HOME/$1" || cd "$HOME" || return
}; alias à='cd_in_home'

alias àd='à dvlp'
alias àda='à dvlp/ngAnalytics'
alias àdd='à dvlp/ngDemo'
alias àde='à dvlp/ngEvents'
alias àdf='à dvlp/ngFraudRegister'
alias àdi='à dvlp/ngIntegration'
alias àdin='à dvlp/ngIntegration/ngVirtualBoxREST'
alias àdiv='à dvlp/ngIntegration/vagrant'
alias àdp='à dvlp/ngPollingSystem'
alias àds='à dvlp/ngScreener/'
alias àdsb='à dvlp/ngScreener/ngBrowser'
alias àdsbf='à dvlp/ngScreener/ngBrowser/frontend'
alias àdsbb='à dvlp/ngScreener/ngBrowser/back'

alias àf='à frno'
alias àfd='à frno/dotfiles'
alias àff='à frno/fraud-register'
alias àfi='à frno/impec_control'

alias àn='à Documents/notes'

