#!/bin/bash

# Install fisher (fish plugin manager) and initial plugins
# This runs once - subsequent plugin updates handled by run_after_fisher_update.sh

# List of fisher plugins to install
FISHER_PLUGINS=(
    "PatrickF1/fzf.fish"
)

if ! command -v fish &> /dev/null; then
    echo "Fish shell not found, skipping fisher installation..."
    exit 0
fi

# Install fisher if not already installed
if ! fish -c "type -q fisher" 2>/dev/null; then
    echo "Installing fisher..."
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
    echo "Fisher installed successfully"
else
    echo "Fisher already installed, skipping fisher installation..."
fi

# Install initial plugins
echo "Installing fisher plugins..."
for plugin in "${FISHER_PLUGINS[@]}"; do
    echo "Installing $plugin..."
    fish -c "fisher install $plugin"
done

echo "Fisher setup complete"
