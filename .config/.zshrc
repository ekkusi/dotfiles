alias nvim=$HOME/.local/share/bob/nvim-bin/nvim

alias clear-swap="rm ~/.local/state/nvim/swap/*"
alias analyze-perf="~/.dotfiles/shell/analyze_perf.sh"
alias kill-node-and-nvim="killall -9 nvim && killall -9 node"

# Git
alias copy-commit-messages='git log main..HEAD --pretty=format:"%B" |pbcopy'
alias git-clean-branches="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D"
alias copy-branch="git branch --show-current | tr -d '\n' | pbcopy"
alias gitlog="git log --oneline -10"
alias fixup='git commit --fixup'
alias rebase='git rebase -i --autosquash origin/main'
alias forcepush='git push --force'

# Load machine-specific config if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
