# User binaries
export PATH="${HOME}/.local/bin:${PATH}"

# Default editor
export EDITOR="nvim"

# Set GPG_TTY to allow signing git commits
export GPG_TTY="$(tty)"

# Rust
export PATH="${HOME}/.cargo/bin:${PATH}"

# Golang
export GOPATH="${HOME}/Development/go"
export PATH="${GOPATH}/bin:${PATH}"

# zsh: run-help
export HELPDIR="/usr/local/share/zsh/help"

# GNU tools man pages
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
export MANPATH="/usr/local/opt/findutils/share/man:${MANPATH}"
export MANPATH="/usr/local/opt/gnu-sed/share/man:${MANPATH}"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:${MANPATH}"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"

# system binaries (sbin)
export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"

# GNU coreutils original names (non g-prefixed)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# GNU Findutils (xargs)
export PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:${PATH}"

# LaTeX / MacTeX binaries
export PATH="/Library/TeX/texbin:${PATH}"

# GNU Gettext (envsubst)
export PATH="/usr/local/opt/gettext/bin:${PATH}"

# Homebrew Ruby Gem executables
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:${PATH}"
export PATH="/usr/local/opt/ruby/bin:${PATH}"
