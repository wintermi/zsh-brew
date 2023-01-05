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
    # Tidy up environment
    unset DEFAULT_BREW_PATHS
    unset BREW_PATH
fi

if (( $+commands[brew] )); then
    # If the 'HOMEBREW_PREFIX' environment variable is not populated then
    # request the prefix from 'brew' and populate

    if [[ -z "$HOMEBREW_PREFIX" ]]; then
        export HOMEBREW_PREFIX="$(brew --prefix)"
    fi

    # Add Homebrew 'site-functions directory to the FPATH
    local HOMEBREW_SITE_FUNCTIONS="$HOMEBREW_PREFIX/share/zsh/site-functions"

    if [[ -d "$HOMEBREW_SITE_FUNCTIONS" ]]; then
        typeset -TUx FPATH fpath
        fpath=("$HOMEBREW_SITE_FUNCTIONS" $fpath)
        autoload -Uz compinit
        compinit
    fi
    # More tidying up
    unset HOMEBREW_PREFIX
    unset HOMEBREW_SITE_FUNCTIONS
fi
