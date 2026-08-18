# ==========================================
# Navigation
# ==========================================

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dots='cd ~/philly-dotfiles'


# ==========================================
# Files
# ==========================================

alias ls='eza -al --color=always --group-directories-first --icons=always'
alias ll='eza -l --color=always --group-directories-first --icons=always'
alias la='eza -a --color=always --group-directories-first --icons=always'
alias lt='eza -aT --color=always --group-directories-first --icons=always'

alias cls='clear'
alias ff='fastfetch'


# ==========================================
# System
# ==========================================

alias top='btop'
alias ports='ss -tulpn'

alias update='sudo cachyos-rate-mirrors && sudo pacman -Syu'
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias mirror='sudo cachyos-rate-mirrors'


# ==========================================
# Git
# ==========================================

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

alias glog='git log --oneline --graph --decorate --all'
