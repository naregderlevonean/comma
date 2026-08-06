# Environment

export COLORTERM=truecolor

export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim

export LIBVIRT_DEFAULT_URI="qemu:///system"


# Colors

autoload -Uz colors
colors


# Oh My Zsh

CASE_SENSITIVE=true

plugins=(
    git
    colored-man-pages
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"


# Prompt

MARK=" "

[[ "$TERM" == "linux" ]] && MARK="└→"

if [[ $EUID -eq 0 ]]; then

    PROMPT="
%F{009}%~%f
%F{011}%n%f
%F{011}${MARK}%f "

else

    PROMPT="
%F{012}%~%f
%F{015}%n%f
%F{007}${MARK}%f "

fi


# Git prompt

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats 'git:%b'

precmd() {
    vcs_info
}

RPROMPT='%F{013}${vcs_info_msg_0_}%f'


# fnm

if command -v fnm >/dev/null; then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi


# History

export HISTFILE="$HOME/.histfile"

export HISTSIZE=500000
export SAVEHIST=500000

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE


# Completion

autoload -Uz compinit

compinit -d "$HOME/.zcompdump"

zstyle ':completion:*' menu select


# Aliases

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias less='less -R'

alias ..='cd ..'
alias ...='cd ../..'

alias c='clear'
alias v='nvim'


# Completion colors

export LS_COLORS='di=94:fi=0:ln=96:or=91:mh=40:bd=33:cd=93:pi=33:so=95:ex=92:mi=40:su=92;45:sg=92;44:ca=30;41:tw=94;45:ow=94;44:st=37;41:*.bak=37:*~=37'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# Syntax highlighting

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


# Autosuggestions

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
