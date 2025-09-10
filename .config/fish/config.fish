if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

zoxide init fish | source

# uv
fish_add_path "$HOME/.local/bin"

