export ZSH=~/.oh-my-zsh
export TERM=xterm-256color
export BAT_THEME="One Dark"
export PATH="$HOME/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(
    git
    nvm
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

bindkey '^[b' backward-word
bindkey '^[f' forward-word

alias gs='git status '
alias ga='git add '
alias gb='git branch --sort=-committerdate '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

alias as='arc status '
alias aa='arc add '
alias ab='arc branch '
alias ac='arc commit'
alias ad='arc diff'
alias ao='arc checkout '

alias got='git '
alias get='git '

alias top='htop'
alias cat='bat'
alias mmount='~/.mmount-sshfs.sh'

alias vim='nvim'

alias tmux='tmux -2'

ZSH_TMUX_FIXTERM=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -f .nvmrc ]; then nvm use; fi # This switches nvm to node version from .nvmrc

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --ignore-file /home/$(whoami)/self/dotfiles/.rdignore'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --no-mouse --exact'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -200'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
