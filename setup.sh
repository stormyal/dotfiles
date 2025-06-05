#!/bin/bash






if [[ "$(uname)" = "Linux" ]]; then
    echo "its linux"
    mkdir -p ~/.config
    mkdir -p ~/.config/tmux

    ln -s ~/dotfiles/config/kitty ~/.config/kitty
    ln -s ~/dotfiles/config/nvim ~/.config/nvim
    ln -s ~/dotfiles/config/tmux.conf ~/.config/tmux/tmux.conf
    ln -s ~/dotfiles/config/zshrc ~/.zshrc
    ln -s ~/dotfiles/config/i3 ~/.config/i3

elif [[ "$(uname)" = "Darwin" ]]; then

    # brew install fzf ripgrep

    echo "its macos"

    ln -s ~/dotfiles/config/kitty ~/.config/kitty
    ln -s ~/dotfiles/config/nvim ~/.config/nvim
    ln -s ~/dotfiles/config/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/config/zshrc ~/.zshrc
    # TODO: iterm2
fi

