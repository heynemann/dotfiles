# Load antigen and bundles
# Antigen is a small set of functions that help you easily
# manage your shell (zsh) plugins, called bundles.
# The concept is pretty much the same as bundles in a 
# typical vim+pathogen setup. Antigen is to zsh, what Vundle is to vim.
# https://github.com/zsh-users/antigen

source $(brew --prefix)/share/antigen/antigen.zsh

# Bundles
# antigen bundle <name of bundle>

# https://github.com/zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# https://github.com/zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Apply bundles
antigen apply
