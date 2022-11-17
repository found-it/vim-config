alias vm='multipass shell docker-alt'
alias ls='exa --icons'
alias lsg='exa --long --header --icons --git'
alias kc='kubecolor'
alias lst='exa --icons --tree'
alias k='kubecolor'
alias spinup='$HOME/dev/tools/k3d-anchore; and python3 spinup'
alias wk='watch -c kubecolor'
alias kim='kubectl get pods -o custom-columns=CONTAINER:.spec.containers[0].name,IMAGE:.spec.containers[0].image -n anchore'
alias nerdctl='nerdctl.lima'
alias cloudflared_services='cloudflared --origincert $HOME/.cloudflared/services.pem'
alias cloudflared_live='cloudflared --origincert $HOME/.cloudflared/live.pem'
alias cat='bat -p'
export GPG_TTY=(tty)

# export NVM_DIR="$HOME/.nvm"
# test -s "$NVM_DIR/nvm.sh" && source "$NVM_DIR/nvm.sh"  # This loads nvm

starship init fish | source
