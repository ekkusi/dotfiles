alias nvim=$HOME/.local/share/bob/nvim-bin/nvim

alias clear-swap="rm ~/.local/state/nvim/swap/*"
alias git-clean-branches="git branch --merged origin/main | grep -v main | xargs git branch -d"

# Load machine-specific config if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
