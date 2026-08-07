# ==========================================
# Homebrew
# ==========================================

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ==========================================
# tarship Prompt
# ==========================================

eval "$(starship init bash)"

# ==========================================
# Fastfetch
# Show only in interactive shells
# ==========================================

if command -v fastfetch >/dev/null && [[ $- == *i* ]]; then
    fastfetch
fi

# ==========================================
# zoxide
# ==========================================


eval "$(zoxide init bash)"

# ===== Aliases =====

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Listing (eza)
alias ls="eza --icons=auto"
alias ll="eza -lah --icons --git"
alias la="eza -a --icons"
alias lt="eza --tree --level=2 --icons"

# Better cat
alias cat="bat"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"

# System
alias cls="clear"
alias ff="fastfetch"
alias top="btop"

# Bazzite
alias update="ujust update"

# Disk usage
alias df="df -h"
alias du="du -sh"

#Custom
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias reload="source ~/.bashrc"
alias dots="cd ~/philly-dotfiles"

# ==========================================
# Custom Functions
# ==========================================

mkcd() {
    mkdir -p "$1"
    cd "$1"
}


