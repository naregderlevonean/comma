clear
export ZSH_DISABLE_COMPFIX=true
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export EDITOR="/usr/bin/nvim"
export ZSH="$HOME/.oh-my-zsh"
export LIBVIRT_DEFAULT_URI="qemu:///system"
export MARK=" "

[ $TERM = "linux" ] && MARK="└→"

if [[ $EUID -eq 0 ]]; then
export PROMPT='
%{$FG[009]%}%~%{$reset_color%}
%{$FG[011]%}%n%{$reset_color%}
%{$FG[011]%} $MARK %{$reset_color%}'
else
export PROMPT='
%{$FG[012]%}%~%{$reset_color%}
%{$FG[015]%}%n%{$reset_color%}
%{$FG[007]%} $MARK %{$reset_color%}'
fi

autoload -Uz vcs_info
precmd() { vcs_info }
export RPROMPT='%{$FG[005]%}${vcs_info_msg_0_}%{$reset_color%} '

zstyle ':vcs_info:git:*' formats 'git:%b'

accept-line() { [[ -z "$BUFFER" ]] || zle .accept-line }
zle -N accept-line

CASE_SENSITIVE="true"

plugins=(
	git
	colored-man-pages
	colorize
	sudo
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export HISTFILE=~/.histfile
export HISTSIZE=10000000
export SAVEHIST=10000000

# export TERM=xterm-256color
# export COLORTERM=truecolor
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias less="-R --use-color -Dd+r\$Du+b\$"

export LS_COLORS="di=94:fi=0:ln=96:or=91:mh=40:bd=33:cd=93:pi=33:so=95:ex=92:mi=40:su=92;45:sg=92;44:ca=30;41:tw=94;45:ow=94;44:st=37;41:*.bak=37:*\~=37"
autoload -U colors && colors

typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[default]='fg=7'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=7'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=3'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=15,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=12'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=15'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=0'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=13'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=13'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=2'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=10'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=2'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=10'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=11'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=11'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=9'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=9'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=9'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=9'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=9'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=1'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=1'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=1'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=1'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=3'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=6'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=6'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=15,bold'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec uwsm start hyprland-uwsm.desktop > /dev/null 2>&1
    exit
fi

clear
