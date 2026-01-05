#!/bin/bash

# Install/update Starship prompt
# The installer is idempotent - updates if newer version available

echo "Installing/updating Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
echo "Starship complete"
