#
#
#   Install and configure NeoVim
#
#   James Petersen
#
#   TODO: Check for everything before moving on
#   TODO: Use an https option, default to ssh
#

log='/tmp/vim-config.log'

mkdir -p ~/.dotfiles

function install_nvim() {
    # Clone the config repo
    if [ ! -d ~/.dotfiles/vim-config ]; then
        git clone https://github.com/found-it/vim-config.git ~/.dotfiles/vim-config
    else
        echo "vim-config exists - no need to clone" | tee -a $log
        # TODO: git pull?
    fi

    # Grab vim-plug
    echo "Installing |vim-plug|..." &>> $log
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | tee -a $log

    # Set up NeoVim Configuration
    mkdir -p ~/.config/nvim
    cd ~/.config/nvim && ln -s ~/.dotfiles/vim-config/init.vim init.vim | tee -a $log
    cd ~/.config/nvim && ln -s ~/.dotfiles/vim-config/settings.json settings.json | tee -a $log
}


function install_tmux() {
    cd && ln -s ~/.dotfiles/vim-config/tmux.conf .tmux.conf | tee -a $log
}


#
#   TODO: Switch out package manager
#
function install_commands() {

    # Install and update all plugins

    declare -a cmds=(
        "nvim"
        "tree"
        "htop"
    )
    for cmd in "${cmds[@]}";
    do
        command -v "$cmd" > /dev/null || {
            printf " Missing %s - installing\n"
            # Install that ish
            exit 1
        }
        printf " Located %s\n" "$cmd"
    done

    if hash nvim 2>/dev/null; then
        # nvim is installed
        nvim +PlugInstall +PlugUpdate +qa
    else
        echo "You need to install neovim before moving on." | tee -a $log
    fi
}


function main() {
    touch $log
    install_commands
    install_nvim
    install_tmux
}

main
