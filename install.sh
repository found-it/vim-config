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

mkdir -p $HOME/.dotfiles

function install_nvim() {
    # Clone the config repo
    if [ ! -d $HOME/.dotfiles/vim-config ]; then
        git clone https://github.com/found-it/vim-config.git $HOME/.dotfiles/vim-config
    else
        printf "vim-config exists - no need to clone\n" | tee -a $log
        # TODO: git pull?
    fi

    # Grab vim-plug
    printf "Installing |vim-plug|...\n" &>> $log
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | tee -a $log

    mkdir -p $HOME/.vim/colors
    curl -o $HOME/.vim/colors/gruvbox.vim \
        https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim | tee -a $log

    # Set up NeoVim Configuration
    mkdir -p $HOME/.config/nvim
    cd $HOME/.config/nvim && ln -s $HOME/.dotfiles/vim-config/init.vim init.vim | tee -a $log
    cd $HOME/.config/nvim && ln -s $HOME/.dotfiles/vim-config/settings.json settings.json | tee -a $log
}


function install_tmux() {
    cd && ln -s $HOME/.dotfiles/vim-config/tmux.conf .tmux.conf | tee -a $log
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
        printf "You need to install neovim before moving on.\n" | tee -a $log
    fi
}


function main() {
    touch $log
    install_commands
    install_nvim
    install_tmux
}

main
