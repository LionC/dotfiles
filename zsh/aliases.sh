alias nv="nvim"
alias tf="terraform"
alias ae="aerospace"
alias ls="eza --icons --git"

# tmux
alias txl="tmuxp load ."
alias txa="tmux attach-session -t "

# git
alias gsl="git switch -"
alias grocket="git commit --allow-empty --message :rocket:"
alias ghgrep="git rev-list --all | xargs git grep"

# turbo
alias tu="NODE_NO_WARNINGS=1 pnpm turbo run --summarize --concurrency 20"

# brew
alias brewdump="brew bundle dump --file=$HOME/.config/brew/Brewfile --force"

help() {
    "$@" --help 2>&1 | bathelp
}
