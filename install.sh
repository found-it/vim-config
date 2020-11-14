#
#
#   Install and configure NeoVim
#
#   James Petersen
#
#   TODO: Check for everything before moving on
#   TODO: Use an https option, default to ssh
#

logfile='/tmp/vim-config.log'

mkdir -p $HOME/.dotfiles

function install_nvim() {
    # Clone the config repo
    if [ ! -d $HOME/.dotfiles/vim-config ]; then
        git clone https://github.com/found-it/vim-config.git $HOME/.dotfiles/vim-config
    else
        printf "vim-config exists - no need to clone\n" | tee -a $logfile
        # TODO: git pull?
    fi

    # Grab vim-plug
    printf "Installing |vim-plug|...\n" | tee -a $logfile
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | tee -a $logfile

    mkdir -p $HOME/.vim/colors
    curl -o $HOME/.vim/colors/gruvbox.vim \
        https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim | tee -a $logfile

    # Set up NeoVim Configuration
    mkdir -p $HOME/.config/nvim
    cd $HOME/.config/nvim && ln -s $HOME/.dotfiles/vim-config/init.vim init.vim | tee -a $logfile
    cd $HOME/.config/nvim && ln -s $HOME/.dotfiles/vim-config/settings.json settings.json | tee -a $logfile
}


function install_tmux() {
    cd && ln -s $HOME/.dotfiles/vim-config/tmux.conf .tmux.conf | tee -a $logfile
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
            printf " Missing %s - installing\n" | tee -a $logfile
            # Install that ish
            exit 1
        }
        printf " Located %s\n" "$cmd"
    done

    if hash nvim 2>/dev/null; then
        # nvim is installed
        nvim +PlugUpgrade +PlugInstall +PlugUpdate +qa
    else
        printf "You need to install neovim before moving on.\n" | tee -a $logfile
    fi
}


function main() {
    touch $logfile
    install_commands
    install_nvim
    install_tmux
}

main
