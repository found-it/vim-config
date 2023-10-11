#
# File: config.fish
# Author: found-it
#

# Aliases
# TODO: Do this more fish-like

# Single letters
alias n='nerdctl'
alias c='chainctl'
alias k='kubecolor'

# Kubernetes
alias kc='kubecolor'
alias wk='watch -c kubecolor --force-colors'
alias kim='kubectl get pods -o custom-columns=CONTAINER:.spec.containers[0].name,IMAGE:.spec.containers[0].image'

# File listing
alias ls='exa --icons'
alias lsg='exa --long --header --icons --git'
alias lst='exa --icons --tree'
alias lsi='exa --icons --long --octal-permissions --header'
alias cat='bat -p'

# Chainguard
# alias melange='nerdctl run --rm -it --privileged --volume "$PWD:/work" cgr.dev/chainguard/melange@sha256:dd317f4b2a09019c43f1f712f240a7ce1cbd0d767086138b265f43fca9982308'
# alias apko='nerdctl run --rm -it --privileged --volume "$PWD:/work" ghcr.io/wolfi-dev/sdk@sha256:e6413fdb3f60db822ee0217c246f55f1cb8ee9bd3d78241aa218e7c4b3ef5790'


export GPG_TTY=(tty)

# alias nerdctl='nerdctl.lima'

# export NVM_DIR="$HOME/.nvm"
# test -s "$NVM_DIR/nvm.sh" && source "$NVM_DIR/nvm.sh"  # This loads nvm

# Initialize starship
starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/james/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/james/Downloads/google-cloud-sdk/path.fish.inc'; end
