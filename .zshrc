if [ -f "$HOME/.amazonrc" ]; then
  source "$HOME/.amazonrc"
fi

# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


export EDITOR='vim'

export PATH=$HOME/.rbenv/bin:$PATH

if [[ "$OSTYPE" == *darwin* ]] then
  export PATH=/usr/local/bin:$PATH
  export PATH=~/.cabal/bin:$PATH
fi

if [[ "$TERM" == *rxvt* ]] then
    bindkey  "^[[7~"   beginning-of-line
    bindkey  "^[[8~"   end-of-line
fi

if [[ "$OSTYPE" == *linux* ]] then
  alias ls='ls --color=auto'
  function open {
      ((xdg-open $1 &> /dev/null &)&)
  }

  case "$TERM" in
    xterm*) export TERM=xterm-256color
  esac
fi

# Kill ctrl-s as much as possible
setopt NO_FLOW_CONTROL

export PATH=$HOME/bin/:$PATH

alias be='bundle exec'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval "$(rbenv init -)"

# Start X at log in for my desktop
[[ `hostname -s` = "ThinkingMachine" && -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
