#!/bin/bash

ln -snf "$(pwd)/.config/nvim" "${HOME}/.config/nvim"
ln -snf "$(pwd)/.config/fish" "${HOME}/.config/fish"
ln -snf "$(pwd)/.config/tmux/tmux.conf" "${HOME}/.tmux.conf"

## Install homebrew.
#os_name="$(uname -s)"
#if [[ $os_name == "Linux" ]]; then
#    mkdir ~/.linuxbrew
#    curl -L "https://github.com/Homebrew/brew/tarball/master" | tar xz --strip 1 -C ~/.linuxbrew
#    eval $(~/.linuxbrew/bin/brew shellenv)
#elif [[ $os_name == "Darwin" ]]; then
#    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#    eval $(/opt/homebrew/bin/brew shellenv)
#else
#    echo "Not supported OS" $os_name
#fi
#brew developer off
#
## Install/setup fish shell.
#brew install fish
#error_msg=$(echo "$(which fish)" | tee -a /etc/shells 2>&1 > /dev/null)
#if [[ $error_msg == *"Permission denied"* ]]; then
#    echo "$(which fish)" | sudo tee -a /etc/shells
#fi
#chsh -s "$(which fish)"
#fish -c "fish_add_path {\$HOME}/.linuxbrew/bin"  # add brew path to fish shell.
#
## Install/setup tmux.
#brew install tmux
#
## Install/setup neovim.
#brew install neovim
#
## Install exa.
#brew install exa
#
## Install starship.
#brew install starship
