# zsh options
setopt always_to_end       \
       auto_cd             \
       auto_name_dirs      \
       auto_param_slash    \
       cdablevarS          \
       complete_in_word    \
       correct             \
       extended_glob       \
       extended_history    \
       hist_beep           \
       hist_ignore_alldups \
       hist_ignore_dups    \
       hist_ignore_space   \
       hist_no_store       \
       hist_reduce_blanks  \
       ignore_eof          \
       inc_append_history  \
       multios             \
       no_single_line_zle  \
       noflowcontrol       \
       pushd_ignore_dups   \
       pushd_silent        \
       pushd_to_home

# history
HISTFILE=~/.zsh/local/history
HISTSIZE=10000
SAVEHIST=10000

# 100ms timeout for key sequences (defaults to 400ms)
KEYTIMEOUT=50

# exports
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export RSYNC_RSH=ssh

# aliases
alias ag="ag -S --color-match='30;31' --color-line-number='31;35' --color-path='31;34'"
alias clj='lein repl'
alias cp='nocorrect cp'
alias curl='noglob curl'
alias diff='git diff --color=never --no-index'
alias ff=ffind
alias g=grep
alias grep='grep -i --color=auto'
alias l=ls
alias md=take
alias mv='nocorrect mv'
alias nc='rlwrap nc'
alias qmv=qmv-defaults
alias rm='nocorrect rm'
alias rmf='rm -rf'
alias rscp='rsync --partial --progress --rsh=ssh'
alias scp='scp -C'
alias sl=ls
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias ssh-proxy='ssh -C2qTN -D 9999'
alias tree='tree --dirsfirst -F'
alias utc='date -u'
alias zip='zip -r -9'

# zeesh aliases
alias help='zeesh help'
alias plugin=zeesh-plugin
alias prefs=zeesh-prefs
alias tips='zeesh tips'
alias vcs='zeesh-plugin-enable vcs-info'

## keybindings
bindkey "^J" self-insert
bindkey "\e[3~" delete-char
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey ' ' magic-space
bindkey '^[[Z' reverse-menu-complete
bindkey '^R' history-incremental-search-backward
bindkey -s '^L' "|$PAGER"
bindkey '^Q' quote-line
bindkey -s '^N' '> /dev/null 2>&1\n'
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# default prompt
PS1='%n@%m:%~ '

# load funcs
fpath=( ~/.zsh/func $fpath )
autoload -U ~/.zsh/func/*(:t)

# can't live without
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# enable plugins
zeesh-plugin-enable

# source travis if it exists
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

if [ -e ~/.zsh/after.zsh ]; then
    source ~/.zsh/after.zsh
fi

if [ -e ~/.zsh/local.zsh ]; then
    source ~/.zsh/local.zsh
fi
