# Replace `ll` with `exa`.
if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# Neovim.
alias vim "nvim"

# Python.
alias python "python3"

# Starship (cross-shell prompt).
starship init fish | source

# Set vi key binding mode.
fish_vi_key_bindings

# SSH command with tmux argument.
function st
    set os (string trim (ssh $argv -- uname -s))
    if [ $os = "Linux" ]
        set brew_path "~/.linuxbrew/bin"
    else if [ $os = "Darwin" ]
        set brew_path "/opt/homebrew/bin"
    else
        echo Not implemented yet.
        exit 1
    end
    ssh -t $argv -- "export PATH=$brew_path:\$PATH && tmux has-session &> /dev/null && exec tmux attach || exec tmux"
end
