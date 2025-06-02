#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ll="ls -lah"
alias vim="nvim"
alias rm="rm -i"
alias code="code-oss --ozone-platform=wayland"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(batman --export-env)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export EDITOR=nvim
export nova="28:9A:4B:FA:32:58 0000111e-0000-1000-8000-00805f9b34fb"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export -f y
