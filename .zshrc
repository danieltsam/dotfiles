
eval "$(zoxide init zsh)"

alias onvim="fd --type f --hidden --exclude .git | fzf --height 30% --preview 'cat {1}' | xargs nvim"
alias python='python3'
alias zshrc='nvim ~/.zshrc'
alias aconf='nvim ~/.aerospace.toml'
alias newvenv='python3 -m venv .venv && source .venv/bin/activate'
alias gcal='gcalcli'

# For Vim bindings in Temrinal
bindkey -v
export EDITOR=nvim

# 7. FUNCTIONS
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function s() {
  # Get the last ssh command from history and run it again
  local last_ssh=$(fc -lr 1 | grep "ssh " | tail -n 1 | awk '{$1=""; print $0}')
  if [ -n "$last_ssh" ]; then
    eval $last_ssh
  else
    echo "No recent SSH session found in history."
  fi
}
