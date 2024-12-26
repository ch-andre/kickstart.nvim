
NVIM_APPNAME := 'kickstart-nvim'
DIR := justfile_directory()

[private]
default:
    just --list

vim:
    #!/usr/bin/env bash
    ln -s {{ DIR }} $HOME/.config/kickstart-nvim 
    NVIM_APPNAME='{{ NVIM_APPNAME }}' nvim


