#!/bin/bash

# Update Vim plugins via vim-plug
# Runs after files are updated to ensure .vimrc is in place

if ! command -v vim &> /dev/null; then
    echo "Vim not found, skipping plugin update..."
    exit 0
fi

echo "Updating Vim plugins..."
vim +PlugUpdate +qall
echo "Vim plugins updated"
