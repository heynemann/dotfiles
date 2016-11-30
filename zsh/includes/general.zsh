export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ $platform == 'darwin' ]]; then
  source `brew --prefix`/etc/profile.d/z.sh
fi

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit
else
  compinit -C
fi

# Language completions
#source <(npm completion)
source <(pip completion --zsh)
