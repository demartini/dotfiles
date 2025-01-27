# GPG_TTY
set -x GPG_TTY (tty)

# Start or re-use a gpg-agent
gpgconf --launch gpg-agent

# Ensure that GPG Agent is used as the SSH agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
