# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

