# Replace `ll` with `exa`.
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

# Neovim.
alias vim "nvim"

# Starship (cross-shell prompt).
starship init fish | source

# Set vi key binding mode.
fish_vi_key_bindings
