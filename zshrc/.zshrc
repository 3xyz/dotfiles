# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n] # confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vi=vim
alias nv=nvim
alias ..='cd ..'
alias ../..='cd ../..'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

bindkey -e                                        # emacs key bindings
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    if [[ $(uname) == "Darwin" ]]; then
      alias ls='ls -G'
    else
      alias ls='ls --color=auto'
    fi
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# initialize autocompletion
autoload -U compinit

# History configurations
# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=9000
setopt EXTENDED_HISTORY
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
# setopt share_history         # share command history data
setopt share_history         # share command history data

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# (bonus: Disable sound errors in Zsh)
# never beep
setopt NO_BEEP

# enable auto-suggestions based on the history
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh    # change suggestion color
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
fi

if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
   . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
   ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
   ZSH_HIGHLIGHT_STYLES[default]=none
   ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
   ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
   ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
   ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
   ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
   ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
   ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
   ZSH_HIGHLIGHT_STYLES[path]=bold
   ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
   ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
   ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
   ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
   ZSH_HIGHLIGHT_STYLES[command-substitution]=none
   ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
   ZSH_HIGHLIGHT_STYLES[process-substitution]=none
   ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
   ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
   ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
   ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
   ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
   ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
   ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
   ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
   ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
   ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
   ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
   ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
   ZSH_HIGHLIGHT_STYLES[assign]=none
   ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
   ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
   ZSH_HIGHLIGHT_STYLES[named-fd]=none
   ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
   ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
   ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
   ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
   ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
   ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
   ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
   ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
   ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
fi

if [[ -f ~/.zsh/zsh-z.plugin.zsh ]]; then
  source ~/.zsh/zsh-z.plugin.zsh 
fi

# Load Homebrew config script
if [ -f ~/.brewconfig.zsh ]; then
  source $HOME/.brewconfig.zsh
fi
