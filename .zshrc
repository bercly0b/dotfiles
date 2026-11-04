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

ZSH_TMUX_FIXTERM=true
DISABLE_AUTO_UPDATE=true

autoload -Uz compinit
compinit -i

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"


export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --ignore-file $HOME/self/dotfiles/.rgignore'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --no-mouse --exact'
# catppuccin/fzf colors, flavor follows the theme line in ghostty/config
if grep -q '^theme = Catppuccin Mocha' ~/self/dotfiles/ghostty/config 2>/dev/null; then
    FZF_DEFAULT_OPTS+=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
else
    FZF_DEFAULT_OPTS+=" \
--color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 \
--color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
--color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
--color=selected-bg:#BCC0CC \
--color=border:#9CA0B0,label:#4C4F69"
fi
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -200'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"
export PATH="/opt/homebrew/opt/gnupg@2.2/bin:$PATH"
export PATH="/home/$(whoami)/.local/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
export GHOSTTY_CONFIG_FILE="$HOME/self/dotfiles/ghostty/config"
