#!/bin/bash

# Install rustup (Rust toolchain installer) if not already installed
if ! command -v rustup &> /dev/null; then
    echo "Installing rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
    echo "Rustup installed successfully. Restart your shell to use cargo/rustc."
else
    echo "Rustup already installed, skipping..."
fi
