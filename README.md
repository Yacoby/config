### Setup

This stores the git data in a subdirectory to avoid making everything under the home directory a git directory. See [this guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/) for more information and detailed setup instructions

The basic commands to get everything setup are as follows:

    git clone --bare <git-repo-url> $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config checkout
    config submodule update --init --recursive

