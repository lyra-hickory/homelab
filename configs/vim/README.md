# VIM Setup and details

## Installation steps for auto completer, using clangd

### Step 1:

```
sudo apt install clangd clang-format git curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Step 2:

`cp` the `.vimrc` config file included in this repo to `~`

### Step 3:

Run vim and do `:PluginInstall` in order to run the installation

Done! Plugins and formatters and configs should now be loaded.

# Project setup for C

`cp` the `.clang-format` and `compile_flags.txt` to the project root in order to load the autoformatter config and the compile config.

