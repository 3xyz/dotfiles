### Install zsh (if not installed)
```
apt install zsh
```
### Switch to zsh (if not switched) You can check which shell running by `echo $0` 
```
chsh -s /bin/zsh
```
### Install config (WARNING: if you already have config command below rewrite it)
```
curl -o ~/.zshrc https://raw.githubusercontent.com/3xyz/dotfiles/main/zshrc/zshrc
```
### Install plugins
```
mkdir ~/.zsh;
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k/;
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions/;
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting;
curl -o ~/.zsh/zsh-z.plugin.zsh https://raw.githubusercontent.com/agkozak/zsh-z/master/zsh-z.plugin.zsh;
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab/
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf;
~/.fzf/install --no-bash --no-fish;
```
### Then apply changes by:
```
source ~/.zshrc
```
> At first start plugin [powerlevel10k](https://github.com/romkatv/powerlevel10k#manual) suggest u to configure file.
> After configure all must works correctly.
