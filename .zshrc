export ZSH=~/.oh-my-zsh
export TERM=xterm-256color
export PATH="$HOME/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(
    git
    pass
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

bindkey '^[b' backward-word
bindkey '^[f' forward-word

# ESC+k -> clear screen
bindkey '^[k' clear-screen

alias gs='git status --short '
alias ga='git add '
alias gb='git branch --sort=-committerdate '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gw='git worktree '

alias got='git '
alias get='git '

alias top='htop'
alias vim='nvim'
alias tmux='tmux -2'

alias open='~/self/dotfiles/open'

ZSH_TMUX_FIXTERM=true
DISABLE_AUTO_UPDATE=true

autoload -Uz compinit
compinit -i

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --ignore-file /home/$(whoami)/self/dotfiles/.rdignore'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --no-mouse --exact'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -200'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"
export PATH="/opt/homebrew/opt/gnupg@2.2/bin:$PATH"
export PATH="/home/$(whoami)/.local/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
export GHOSTTY_CONFIG_FILE="$HOME/self/dotfiles/ghostty/config"
