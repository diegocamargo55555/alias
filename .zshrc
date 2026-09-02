
alias charles="_JAVA_OPTIONS="-Xmx8192M" charles"

upd() {
    sudo apt update
    sudo apt upgrade
}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


if (( $+commands[eza] )); then
  alias lsd='eza --long --header --group-directories-first --icons=auto'
  alias lt='eza --tree --level=2 --long --icons=auto --git'
  alias lta='lt --all'
fi

alias cat="bat -P --theme zenburn"
alias d='docker'
alias dup='docker compose up -d'
alias ddown='docker compose down'

export ZSH="$HOME/.oh-my-zsh"

lup(){
  ./vendor/bin/sail up -d
  ./vendor/bin/sail artisan migrate --seed
}

dexec() {
  docker exec -it '$1' bash
}

gitall() {
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
