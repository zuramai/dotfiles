#!/bin/bash
#a

# Tells the shell script to exit if it encounters an error
set -e

# -- Log -----------------------------------------------------------------------
# Duplicated code from log.sh
# since we cannot import a file when installing via cURL
function msg {
	echo  "\033[0;37m$1\033[0m";
}

function msg_ok {
	echo  "\033[1;32m $1 \033[0m";
}

function msg_prompt {
	echo  "➜\033[1;37m $1 \033[0m";
}
function msg_nested_done {
	echo  "   * \033[0;37m $1 \033[0m";
}
function msg_category {
	echo  "   * \033[0;33m $1 \033[0m";
}

function msg_nested_lvl_done {
	echo  "       ➜ \033[0;37m $1 \033[0m";
}

function msg_config {
	echo  "➜ \033[1;36m $1 ✔\033[0m";
}

function msg_run {
	echo  "➜\033[1;35m $1  $2\033[0m";
}

function msg_done {
	echo  "✔ \033[1;37m $1 \033[0m";
}
function show_art {
	echo  "\033[1;37m $1 \033[0m";
}

msg '\n'

show_art "     .::            .::      .::    .::                 "
show_art "     .::            .::    .:    .: .::                 "
show_art "     .::   .::    .:.: .:.:.: .:    .::   .::     .:::: "
show_art " .:: .:: .::  .::   .::    .::  .:: .:: .:   .:: .::    "
show_art ".:   .::.::    .::  .::    .::  .:: .::.::::: .::  .::: "
show_art ".:   .:: .::  .::   .::    .::  .:: .::.:            .::"
show_art ".:: .::   .::       .::   .::  .::.:::  .::::   .:: .:: "

msg '\n'
msg_done 'Initializing setup..'
msg '\n'


# Install zsh and oh-my-zsh
msg_done 'Installing zsh and oh-my-zsh'
ansible-playbook zsh/setup.yml


# Install Golang
msg_done 'Installing Golang'
sh ./go/install.sh

# Install PostgreSQL
msg_done 'Installing Postgresql'
pacman -S postgresql pgadmin4
initdb -D /var/lib/postgres/data
