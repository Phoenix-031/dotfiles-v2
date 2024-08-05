# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export ANDROID_HOME=~/Android/Sdk
export PATH="$PATH:~/.flutter/flutter/bin"
export PATH="$PATH:~/Android/Sdk/cmdline-tools/latest/bin"
export PATH="$PATH:~/Android/Sdk/emulator"
export PATH="$PATH:~/Android/Sdk/build-tools"
export PATH="$PATH:~/Android/Sdk/platform-tools"
export PATH="$PATH:/root/.local/share/gem/ruby/3.0.0/bin"
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export PATH="$PATH:~/.cargo/bin"


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
alias clone='~/scripts/clone-git.sh'

PS1='[\u@\h \W]\$ '
# . "$HOME/.cargo/env"


[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

PATH=~/.console-ninja/.bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
exec zsh
