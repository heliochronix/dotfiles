fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
starship init fish | source
if not set -q SSH_AUTH_SOCK
    set -x SSH_AUTH_SOCK $HOME/.1password/agent.sock
end
