ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

HISTSIZE=100000
SAVEHIST=100000

setopt NO_FLOW_CONTROL # Kill ctrl-s as much as possible

# Share history between terminals immediately
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

###################### Plugins ######################
repos=(
  sindresorhus/pure

  zsh-users/zsh-completions

  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions

  qoomon/zsh-lazyload

  # All plugins loaded after this are deferred
  romkatv/zsh-defer

  davidparsson/zsh-pyenv-lazy

  lukechilds/zsh-better-npm-completion
)

plugin-load $repos

###################### Alias ######################
alias config_git='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

###################### Local ######################
if [ -f "$HOME/.localrc" ]; then
  source "$HOME/.localrc"
fi
