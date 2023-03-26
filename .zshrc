ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi

# Kill ctrl-s as much as possible
setopt NO_FLOW_CONTROL

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

repos=(
  sindresorhus/pure

  zsh-users/zsh-completions

  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions

  # All plugins loaded after this are deferred
  romkatv/zsh-defer

  lukechilds/zsh-better-npm-completion
)

plugin-load $repos

####
# Alias
alias config_git='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
