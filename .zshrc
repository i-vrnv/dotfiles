# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LANGUAGE='en_US.UTF-8 git'

LOCALRC="~/.localrc"
test -f $LOCALRC && source $LOCALRC

export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

ZSH_THEME="robbyrussell"

plugins=(git brew docker docker-compose gcloud golang)

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.scripts/git

bindkey -s ^f '~/.scripts/tmux-sessionizer\n'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
[ -x "$(command -v bat)" ] && alias cat="bat"


# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/user/yandex-cloud/path.bash.inc' ]; then source '/Users/user/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/Users/user/yandex-cloud/completion.zsh.inc' ]; then source '/Users/user/yandex-cloud/completion.zsh.inc'; fi

