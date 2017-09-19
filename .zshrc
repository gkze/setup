# Powerline prompt
source "/usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh"

# Online ZSH help
unalias run-help 2>/dev/null
autoload run-help
export HELPDIR="/usr/local/share/zsh/help"

export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"

# Initialize zplug
export ZPLUG_HOME="/usr/local/opt/zplug"
source "${ZPLUG_HOME}/init.zsh"

# Plugins
zplug "lib/completion",                    from:oh-my-zsh
zplug "lib/history",                       from:oh-my-zsh
zplug "lib/key-bindings",                  from:oh-my-zsh
zplug "plugins/docker",                    from:oh-my-zsh, if:"(( $+commands[docker] ))"
zplug "plugins/docker-compose",            from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"
zplug "plugins/httpie",                    from:oh-my-zsh, if:"(( $+commands[http] ))"
zplug "plugins/pip",                       from:oh-my-zsh, if:"(( $+commands[pip2] ))"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Let zplug manage itself
zplug "zplug/zplug"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Z
source "/usr/local/etc/profile.d/z.sh"

# GNU Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# GNU Findutils
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# Google Cloud SDK
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Golang
export GOPATH="${HOME}/Development/go"

# Aliases
alias git='hub'
