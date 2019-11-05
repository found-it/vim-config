#
#
#   Install and configure NeoVim
#
#   James Petersen
#
#   TODO:
#       * Check for everything before moving on

log='/tmp/vim-config.log'

mkdir -p ~/.vim

# Clone the config repo
if [ ! -d ~/.vim/vim-config ]; then
    git clone https://github.com/zer0-f0x/vim-config.git ~/.vim/vim-config
else
    echo "vim-config exists - no need to pull" >> $log
fi

# Grab vim-plug
echo "Installing |vim-plug|..." &>> $log
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>> $log

# Set up NeoVim Configuration
mkdir -p ~/.config/nvim
cd ~/.config/nvim && ln -s ~/.vim/vim-config/init.vim init.vim &>> $log
cd ~/.config/nvim && ln -s ~/.vim/vim-config/settings.json settings.json &>> $log

# Install and update all plugins
if hash nvim 2>/dev/null; then
    # nvim is installed
    nvim +PlugInstall +PlugUpdate +qa
else
    echo "You need to install neovim before moving on." >> $log
    echo "You need to install neovim before moving on."
fi

echo 'alias vim nvim' >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish
