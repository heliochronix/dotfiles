#!/bin/bash

# Install/update fzf binary
# Runs after files are updated to ensure .fzf repo is cloned

if [ -d "$HOME/.fzf" ]; then
    echo "Installing/updating fzf binary..."
    "$HOME/.fzf/install" --bin
    echo "fzf binary complete"
else
    echo "fzf repository not found at ~/.fzf, skipping..."
fi
