# rei's vimrc
This is rei's vimrc use at your own discretion.

## Linux Instructions

Install vim through your system package manager
```bash
$ sudo apt install vim
```
Installation instructions for vim packages
```(bash)
mkdir -p ~/.vim/pack/{anyname}/start
```
cd into it
```(bash)
cd ~/.vim/pack/{anyname}/start
```
then git clone repo
```(bash)
git clone <repo>
```
load helptags
```(bash)
vim -u NONE -c "helptags {plugindir}/doc" -c q
```
## Windows Instructions

Install gVim through some type of shell (Powershell) if possible. The command below will install vim as a CMD app and gVim.
```powershell
$ winget install vim.vim
```
### Windows directory

Create this directory to store vim's configuration files
```
$ $HOME/vimfiles/
```
vimrc location (no dot)
```
$ $HOME/vimfiles/vimrc
```

vim plugin files. install all files here.
```
$ $HOME/vimfiles/pack/dist/start/*
```
### List of Packages
1. [fuzzyy](https://github.com/Donaldttt/fuzzyy)
2. [vim-airline](https://github.com/vim-airline/vim-airline)
3. [vim-floaterm](https://github.com/voldikss/vim-floaterm)
4. [commentary](https://tpope.io/vim/commentary.git)
5. [vim-cpp-modern](https://github.com/bfrg/vim-cpp-modern)

### List of Colorschemes
1. [vim-monokai](https://github.com/crusoexia/vim-monokai)
