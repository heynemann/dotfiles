# Pretty, minimal and fast ZSH prompt
# https://github.com/sindresorhus/pure
# Install with 'brew install pure'

[[ ( -f /home/linuxbrew/.linuxbrew/share/zsh/site-functions/prompt_pure_setup ) ]] && autoload -U promptinit; promptinit && prompt pure
[[ ( ! -f /home/linuxbrew/.linuxbrew/share/zsh/site-functions/prompt_pure_setup ) ]] && print Pure was not found. Please install with \'brew install pure\'.

PURE_PROMPT_SYMBOL="▲ "