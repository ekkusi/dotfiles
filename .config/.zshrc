alias nvim=$HOME/.local/share/bob/nvim-bin/nvim

alias clear-swap="rm ~/.local/state/nvim/swap/*"
alias git-clean-branches="git branch --merged origin/main | grep -v main | xargs git branch -d"
alias copy-commit-messages='git log main..HEAD --pretty=format:"%B" |pbcopy'
alias analyze-perf="~/.dotfiles/shell/analyze_perf.sh"
alias copy-branch="git branch --show-current | tr -d '\n' | pbcopy"

# Load machine-specific config if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
