# Use 1password SSH agent for SSH support

_use_1password_ssh_agent() {
	export SSH_AUTH_SOCK=~/.1password/agent.sock

	if [[ -S ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ]]; then
		export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
	fi
}

_use_gpg_ssh_agent() {
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	_use_gpg_ssh_agent
else
	_use_1password_ssh_agent
fi

