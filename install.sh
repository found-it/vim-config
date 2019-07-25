#
#
#   Install and configure NeoVim
#
#   James Petersen
#
#


mkdir -p ~/.vim

# Clone the config repo
if [ ! -d ~/.vim/vim-config ]; then
    git clone https://github.com/zer0-f0x/vim-config.git
else
    echo "vim-config exists"
fi

cd && ln -s ~/.vim/vim-config/vimrc .vimrc

# Grab vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set up NeoVim Configuration
mkdir -p ~/.config/nvim
cd ~/.config/nvim && ln -s ~/.vim/vim-config/init.vim init.vim
cd ~/.config/nvim && ln -s ~/.vim/vim-config/settings.json settings.json

# Install and update all plugins
nvim +PlugInstall +PlugUpdate +qa
