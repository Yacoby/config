### Setup

This stores the git data in a subdirectory to avoid making everything under the home directory a git directory. See [this guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) for more information and detailed setup instructions

#### Pulling the base config

Run

    git clone --bare <git-repo-url> $HOME/.cfg
    alias config_git='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config_git checkout
    config_git submodule update --init --recursive

#### Tmux

- Open tmux
- Run `prefix` + `I` to install plugins ([see tpm](https://github.com/tmux-plugins/tpm))

#### vim

- Open vim
- Run `:PlugInstall`
