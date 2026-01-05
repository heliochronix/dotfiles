#!/bin/bash

# Update fisher and all installed plugins
# Runs on every chezmoi apply to keep plugins up to date

if ! command -v fish &> /dev/null; then
    echo "Fish shell not found, skipping fisher update..."
    exit 0
fi

if ! fish -c "type -q fisher" 2>/dev/null; then
    echo "Fisher not installed, skipping fisher update..."
    exit 0
fi

echo "Updating fisher plugins..."
fish -c "fisher update"

echo "Fisher plugins updated"
