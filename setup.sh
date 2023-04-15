#!/bin/bash

# Make .config directory and symlinks.
mkdir -p "${HOME}/.config"
ln -sf "$(pwd)/.config/nvim" "${HOME}/.config/nvim"
ln -sf "$(pwd)/.config/fish" "${HOME}/.config/fish"
ln -sf "$(pwd)/.config/tmux/tmux.conf" "${HOME}/.tmux.conf"

# Install homebrew.
os_name="$(uname -s)"
if [[ $os_name == "Linux" ]]; then
    mkdir ~/.linuxbrew
    curl -L "https://github.com/Homebrew/brew/tarball/master" | tar xz --strip 1 -C ~/.linuxbrew
    eval $(~/.linuxbrew/bin/brew shellenv)
elif [[ $os_name == "Darwin" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval $(/opt/homebrew/bin/brew shellenv)
else
    echo "Not supported OS" $os_name
fi
brew developer off

# Install/setup fish shell.
brew install fish

if [[ $os_name == "Linux" ]]; then
    echo "exec $(which fish) -l" > "${HOME}/.bash_profile" 
    fish -c "fish_add_path ${HOME}/.linuxbrew/bin"
elif [[ $os_name == "Darwin" ]]; then
    echo "$(which fish)" | sudo tee -a /etc/shells
    sudo chsh -s "$(which fish)"  
    fish -c "fish_add_path /opt/homebrew/bin"
else
    echo "Not supported OS" $os_name
fi

# Install/setup tmux.
brew install tmux

# Install/setup neovim.
brew install neovim

# Install exa.
brew install exa

# Install starship.
brew install starship

# Install github cli.
brew install gh


