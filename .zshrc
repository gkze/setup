# Powerline prompt
source "/usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh"

# Online ZSH help
unalias run-help 2>/dev/null
autoload run-help

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
zplug "plugins/pip",                       from:oh-my-zsh, if:"(( $+commands[pip3] ))"
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

# Extra completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Z
source "/usr/local/etc/profile.d/z.sh"

# Google Cloud SDK
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Aliases
alias git='hub'
alias g='git'
alias k='kubectl'
alias l='exa -agl --color=always'

# Pipenv completion
if which pipenv >/dev/null; then
    #compdef pipenv
    _pipenv() {
        eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
    }
    if [[ "$(basename ${(%):-%x})" != "_pipenv" ]]; then
        autoload -U compinit && compinit
        compdef _pipenv pipenv
    fi
fi

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# direnv
eval "$(direnv hook ${SHELL})"
