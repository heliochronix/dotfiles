set fish_greeting
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.fzf/bin"

# Only initialize starship if available
if type -q starship
    starship init fish | source
end

if not set -q SSH_AUTH_SOCK
    set -x SSH_AUTH_SOCK $HOME/.1password/agent.sock
end
