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

alias timestamp='date -u +%Y%m%d%H%M%S'

alias git_switch_back='git switch "$(git reflog | grep '"'"'moving from'"'"' | head -n 1 | cut -d '"' '"' -f 6)"'

function find_and_grep {
	find . -name "$1" | xargs -I %  grep --color=always -n "$2"  "%" /dev/null	
}

alias frep='find_and_grep'

# sdkman shortcut
alias java8='sdk use java 8.0.222.hs-adpt'
alias java11='sdk use java 11.0.5.hs-adpt'

# edit shortcuts
function vim_and_source {
	test -n "$1" && vim "$1" && source "$1"
}
alias é='vim'
alias è='vim_and_source'
alias èbashrc='vim_and_source ~/.bashrc'
alias èalias='vim_and_source ~/.bash_aliases'
alias étmux='vim ~/.tmux.conf'

# directories shortcuts
function cd_in_home {
 test -n "$1" && cd "$HOME/$1" || cd "$HOME"
}

alias à='cd_in_home'
alias àd='à dvlp'
alias àda='à dvlp/ngAuth'
alias àds='à dvlp/ngScreener/'
alias àdsb='à dvlp/ngScreener/ngBrowser'
alias àdsbf='à dvlp/ngScreener/ngBrowser/frontend'
alias àdsbb='à dvlp/ngScreener/ngBrowser/back'
alias àdiv='à dvlp/ngIntegration/vagrant'

alias àfd='à frno/dotfiles'
