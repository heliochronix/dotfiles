#!/bin/bash

# Update rustup and installed toolchains if rustup is installed
if command -v rustup &> /dev/null; then
    echo "Updating rustup and Rust toolchains..."
    rustup update
else
    echo "Rustup not installed, skipping update..."
fi
