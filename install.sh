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

install_nvim() {
    # Clone the config repo
    if [ ! -d "$HOME/.dotfiles/vim-config" ]; then
        git clone git@github.com:found-it/vim-config.git "$HOME/.dotfiles/vim-config"
    else
        printf "vim-config exists - no need to clone\n" | tee -a $logfile
        # TODO: git pull?
    fi

    # Grab vim-plug
    # printf "Installing |vim-plug|...\n" | tee -a $logfile
    # curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    #     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | tee -a $logfile
    # git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    #     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # Set up NeoVim Configuration
    printf "Set up configuration [neovim]\n"
    mkdir -p "$HOME/.config/nvim"
    ln -s "$HOME/.dotfiles/vim-config/init.lua" "$HOME/.config/nvim/init.lua" | tee -a $logfile
    ln -s "$HOME/.dotfiles/vim-config/lua/" "$HOME/.config/nvim/lua" | tee -a $logfile
    ln -s "$HOME/.dotfiles/vim-config/settings.json" "$HOME/.config/nvim/settings.json" | tee -a $logfile
    ln -s "$HOME/.dotfiles/vim-config/coc-settings.json" "$HOME/.config/nvim/coc-settings.json" | tee -a $logfile
    # cp coc-settings.json "$HOME/.config/nvim"

    printf "Set up configuration [fish]\n"
    mkdir -p "$HOME/.config/fish"
    ln -s "$HOME/.dotfiles/vim-config/config.fish" "$HOME/.config/fish/config.fish" | tee -a $logfile

    printf "Set up configuration [alacritty]\n"
    ln -s "$HOME/.dotfiles/vim-config/alacritty.yaml" "$HOME/.alacritty.yml" | tee -a $logfile
}


install_tmux() {
  printf "Set up configuration [tmux]\n"
  ln -s "$HOME/.dotfiles/vim-config/tmux.conf" "$HOME/.tmux.conf" | tee -a $logfile
}


#
#   TODO: Switch out package manager
#
install_commands() {

    # Install and update all plugins

    # cat /etc/os-release | grep -i "arch linux"
    if hash pacman 2>/dev/null; then
      sudo pacman --sync --refresh --noconfirm exa fish neovim tmux git wget nodejs python-pip
    # elif hash brew 2>/dev/null; then
    #   brew install neovim
    #   brew install bat
    fi

    declare -a cmds=(
        "nvim"
    )
    for cmd in "${cmds[@]}";
    do
        command -v "$cmd" > /dev/null || {
            printf " Missing %s - install it\n" "$cmd" | tee -a $logfile
            # Install that ish
            exit 1
        }
        printf " Located %s\n" "$cmd"
    done

    if hash nvim 2>/dev/null; then
        # nvim is installed
        # nvim +PlugUpgrade +PlugInstall +PlugUpdate +qa
        nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    else
        printf "You need to install neovim before moving on.\n" | tee -a $logfile
    fi
}


#
#   Utilities:
#   - nvim
#   - tree
#   - htop
#   - ripgrep
#   - glow
#   - ctop
#   - exa
#   - stern
#   - tldr
#   - jq
#   - bat
#
main() {

    mkdir -p "$HOME/.dotfiles"
    touch $logfile

    install_commands
    install_nvim
    install_tmux
}

main
