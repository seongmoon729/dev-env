#!/bin/bash

# Make .config directory and symlinks.
if [[ ! -d "${HOME}/.config" ]]; then
    mkdir "${HOME}/.config"
else
    rm -rf "${HOME}/.config/nvim"
    rm -rf "${HOME}/.config/fish"
fi
ln -sf "$(pwd)/.config/nvim" "${HOME}/.config/nvim"
ln -sf "$(pwd)/.config/fish" "${HOME}/.config/fish"
ln -sf "$(pwd)/.config/tmux/tmux.conf" "${HOME}/.tmux.conf"
ln -sf "$(pwd)/.config/starship/starship.toml" "${HOME}/.config/starship.toml"

## Install homebrew.
#os_kernel_name="$(uname -s)"
#if [[ $os_kernel_name == "Linux" ]]; then
#    linux_brew_path="${HOME}/.linuxbrew"
#    mkdir "${linux_brew_path}"
#    curl -L "https://github.com/Homebrew/brew/tarball/master" | \
#        tar xz --strip 1 -C "${linux_brew_path}"
#    eval "$(${linux_brew_path}/bin/brew shellenv)"
#elif [[ $os_kernel_name == "Darwin" ]]; then
#    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#    eval $(/opt/homebrew/bin/brew shellenv)
#else
#    echo "Not supported OS" $os_kernel_name
#fi
#brew developer off
#
## Install fish shell.
#brew install fish
#
## Install exa.
#brew install exa
#
## Install starship.
#brew install starship
#
## Install neovim.
#brew install neovim
#
## Install github cli.
#brew install gh
#
## Install/setup tmux.
#brew install tmux
#
## Change default shell to fish and add `brew` path.
#if [[ $os_kernel_name == "Linux" ]]; then
#    echo "exec $(which fish) -l" > "${HOME}/.bash_profile" 
#    fish -c "fish_add_path ${linux_brew_path}/bin"
#elif [[ $os_kernel_name == "Darwin" ]]; then
#    echo "$(which fish)" | sudo tee -a "/etc/shells"
#    sudo chsh -s "$(which fish)"  
#    fish -c "fish_add_path /opt/homebrew/bin"
#else
#    echo "Not supported OS" $os_kernel_name
#fi
#
## Install fisher (plugin manger for fish shell).
#fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | \
#    source && fisher install jorgebucaran/fisher"
#fish -c "fisher install jethrokuan/z"  # install `z`.
#
## Kill tmux server if older version is already running on the machine.
#tmux kill-server
