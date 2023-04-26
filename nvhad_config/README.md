# [NvChad](https://nvchad.com/docs/quickstart/install) installation (Linux/MaxOS)

```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1;
```

Config installation
```sh
mkdir -p ~/.config/nvim/lua/castom;
git clone --depth=1 git@github.com:3xyz/dotfiles.git;
mv dotfiles/nvchad_config/* ~/.config/nvim/lua/custom/;
nvim
```
Delete repository
```sh
rm -rf dotfile/
```
