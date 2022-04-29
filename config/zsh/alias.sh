alias v="vim -N"
alias s="$BIN/s.sh"
alias q="exit"
alias d-rm="docker ps -q -a | xargs docker stop && docker ps -q -a | xargs docker rm"
alias d-rmi="docker rmi $(docker images -a -q)"

source $DOTFILES/private/zsh/alias.sh
