# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias cd..="cd .."
alias cls="clear"
alias cp="cp -i"
alias cwd="pwd"
alias df="df -h"
alias ducks="du -cks * | sort -nr | less"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias free="free -h"
alias grep="grep --color=auto"
alias la="ls -laF --color=auto"
alias ll="ls -lF --color=auto"
alias ln="ln -i"
alias ls="ls -F --color=auto"
alias md="mkdir"
alias more="less"
alias mv="mv -i"
alias rd="rmdir"
alias rm="rm -i"
alias tree="tree -C"
alias vi="vim"alias la='ls -la'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias clone="/home/debayan/scripts/clone_git.sh"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

alias git-list-br='function _git_branches_by_prefix() { git branch | grep "^ *$1"; }; _git_branches_by_prefix'
PATH=~/.console-ninja/.bin:$PATH

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export ANDROID_HOME=~/Android/Sdk
export PATH="$PATH:~/.flutter/flutter/bin"
export PATH="$PATH:~/Android/Sdk/cmdline-tools/latest/bin"
export PATH="$PATH:~/Android/Sdk/emulator"
export PATH="$PATH:~/Android/Sdk/build-tools"
export PATH="$PATH:~/Android/Sdk/platform-tools"
export PATH="$PATH:/root/.local/share/gem/ruby/3.0.0/bin"
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:~/.cargo/bin"
# PATH=~/.cargo/bin
