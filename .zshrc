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
zplug "plugins/terraform",                 from:oh-my-zsh, if:"(( $+commands[terraform] ))"
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
fpath=(/usr/local/share/zsh-completions ~/.zfunc $fpath)

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

# Gitignore utility
function gi() { curl -sL https://www.gitignore.io/api/$@ | tail -n+5 | head -n-2 ;}

# JSON AWS CLI output
function jaws() { aws "$@" | jq -Cr '.' | bat }

# direnv
eval "$(direnv hook ${SHELL})"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/terraform/0.11.13/bin/terraform terraform

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/gkontridze/Development/github.plaid.com/plaid/plaidip-serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/gkontridze/Development/github.plaid.com/plaid/plaidip-serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/gkontridze/Development/github.plaid.com/plaid/plaidip-serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/gkontridze/Development/github.plaid.com/plaid/plaidip-serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/gkontridze/Development/github.plaid.com/plaid/plaidip-serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/gkontridze/Development/github.plaid.com/plaid/plaidip-serverless/node_modules/tabtab/.completions/slss.zsh