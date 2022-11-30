# Local Configuration for Vim

All you need to do is curl the install script for this repository and run it
using bash and it will take care of installing everything for you.

```bash
curl -L https://raw.githubusercontent.com/found-it/vim-config/master/install.sh | bash
```

The configuration will link a vimrc for regular old vim. It will also install
vim-plug as the plugin manager and link an nvim init file.

## Plugins


## TODO
* Install colorschemes
```bash
wget -O ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
```
* Setup aliases for terminal
* Download and set up fish
* Install
    * htop
    * tree
    * neovim

## Install python language server plugins

```sh
:PylspInstall pyls-flake8 pylsp-mypy pyls-isort
```

# Installing on Fedora

### Alacritty
```
sudo dnf install -y alacritty
```

Need to make sure the alacritty config uses the proper path for `fish` for the login shell

Need to make sure to install the correct fonts

### Neovim
```
# Install libraries for neovim
sudo dnf install -y \
  gcc-c++.x86_64 \
  libstdc++-static.x86_64
```

### Fish

Need to install starship
