#!/usr/bin/env bash
#
# setup.sh
# KuoE0 <kuoe0.tw@gmail.com>
# Copyright (C) 2016
#
# Distributed under terms of the MIT license.
#

OS=$(uname)
echo $OS

if [ "$OS" = 'Darwin' ]; then
	brew install reattach-to-user-namespace
fi

TMUX_FOLDER="$HOME/.tmux"
TMUX_CONFIG="$HOME/.tmux.conf"
PLUGIN_FOLDER="./plugins"

if [ -d "$PLUGIN_FOLDER" ]; then
	rm -rf "$PLUGIN_FOLDER"
fi
mkdir "$PLUGIN_FOLDER"

git clone --depth 1 https://github.com/tmux-plugins/tpm plugins/tpm

if [ -f "$TMUX_FOLDER" ]; then
	rm "$TMUX_FOLDER"
fi
ln -s "$PWD" "$TMUX_FOLDER"

if [ -f "$TMUX_CONFIG" ]; then
	rm "$TMUX_CONFIG"
fi
ln -s "$PWD/tmux.conf" "$TMUX_CONFIG"

echo "Launch tmux and run <prefix+I> to install plugins..."
