#!/usr/bin/env zsh
# shellcheck disable=SC1090

# Identify the path of the 'brew' command if cannot already be found
if (( ! $+commands[brew] )); then
    local DEFAULT_BREW_PATHS=("/opt/homebrew/bin/brew" \
                              "/usr/local/bin/brew" \
                              "/home/linuxbrew/.linuxbrew/bin/brew" \
                              "$HOME/.linuxbrew/bin/brew")
    for bp in "${DEFAULT_BREW_PATHS[@]}"; do
        if [ -x "$bp" ]; then
            local BREW_PATH="$bp"
            break
        fi
    done

    eval "$("$BREW_PATH" shellenv)"
fi
