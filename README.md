# zsh-brew
A zsh plugin for the Homebrew package manager.

## Install
Using the [:zap: Zap](https://www.zapzsh.org/) minimal zsh plugin manager, add the following to your `.zshrc`

```sh
# Install plugin
plug "wintermi/zsh-brew"

# Load and initialise completion system
autoload -Uz compinit
compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
```

If you do not have the brew install directory already within your `$PATH`, be sure to include this plugin before any additional plugins that use applications installed via brew (e.g. eza, starship, etc.).

## Prerequisite Checks
A check will be performed to verify that `brew` has been installed:

- [`brew`](https://brew.sh/) - Homebrew - The missing package manager for macOS (or Linux)


## Completions
This plugin will ensure that any `brew` installed package which contains shell completions and site functions have been correctly configured for `zsh` to utilise, though we no longer execute the `compinit` directly within the plugin to reduce the overall `zsh` shell startup time.  Therefore we recommend you add the following to your `.zshrc` after all plugins have been loaded and try to ensure that it is executed only once.

```sh
# Load and initialise completion system
autoload -Uz compinit
compinit -d "${ZDOTDIR:-$HOME}/.zcompdump"
```

## License
The **zsh-brew** plugin is released under the [Apache License 2.0](https://github.com/wintermi/zsh-brew/blob/main/LICENSE) unless explicitly mentioned in the file header.
