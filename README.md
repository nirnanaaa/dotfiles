# Dotfiles

Powered by the awesome purzelrakete/dotfiles

A complete console based workflow. Solarized dark and light configured for
everything.

- Zsh and bash with tmux
- Scripts & tools in bin/

## Installation

Clone the repository into

    git clone git@github.com:nirnanaaa/dotfiles ~/dotfiles

Symlink dotfiles into your home directory

    cd ~/dotfiles
    ./pin

You can also archive current dotfiles that would be overwritten by running

    archive

which creates ~/.dotarchive with your current files.

### Installing packages

A number of packages such as vim, mutt and emacs are required to run together
with these dotfiles. Have a look at dot/.install for brew, deb, cpan and other
dependencies. These lists are currently not stripped down to the minimal set.
