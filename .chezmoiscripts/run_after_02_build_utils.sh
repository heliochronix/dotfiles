#!/bin/bash

# Install/update Rust utilities from crates.io
# This script runs after rustup update to ensure we have the latest toolchain

if ! command -v cargo &> /dev/null; then
    echo "Cargo not found, skipping utility installation..."
    exit 0
fi

echo "Installing/updating Rust utilities from crates.io..."

# Install utilities (cargo install skips if already at latest version)
cargo install fd-find
cargo install bat
cargo install ripgrep

echo "Rust utilities complete"
