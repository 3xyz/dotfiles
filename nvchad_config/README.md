## Before install u need to remove paste config

```sh
rm -rf ~/.local/share/nvim/* ~/.local/share/nvim/.*;
rm -rf ~/.config/nvim/* ~/.config/nvim/.*
```

## [NvChad](https://nvchad.com/docs/quickstart/install) installation (Linux/MaxOS)

```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1;
```

## Config installation
```sh
mkdir -p ~/.config/nvim/lua/custom;
git clone --depth=1 git@github.com:3xyz/dotfiles.git;
cp -r ./dotfiles/nvchad_config/* ~/.config/nvim/lua/custom
```
## Delete repository
```sh
rm -rf dotfiles/
```
