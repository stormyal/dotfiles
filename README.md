First things first
```
cd ~
git clone https://github.com/svtkhn/dotfiles.git
```

```
cd dotfiles
TODO: run script to autoconfigure depending on OS.
```

Manual Process:

- nvim
- zsh
- p10k
- tmux


```
# TODO: if ubuntu...
sudo apt-get upgrade
sudo apt install neovim
sudo apt install zsh
chsh -s /usr/bin/zsh # TODO: for mac?
# TODO: handle errors 
sudo apt install tmux
sudo apt install ripgrep
sudo apt install fzf


git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"

<restart shell>

ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/.ignore $HOME/.ignore





# TODO if macos...

git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
brew install fzf
brew install ripgrep
/opt/homebrew/opt/fzf/install

```

configure prompt
```
p10k configure
```

---

On Windows: WSL -> Ubuntu
