#!/bin/bash

# Install/update fzf binary
if [ -d "$HOME/.fzf" ]; then
    "$HOME/.fzf/install" --bin > /dev/null 2>&1
fi
