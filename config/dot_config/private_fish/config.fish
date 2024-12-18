# shellcheck shell=fish

# Set TERM to xterm-256color
set -x TERM xterm-256color

# Homebrew Configuration
set -x HOMEBREW_NO_ENV_HINTS 1
set -x HOMEBREW_AUTO_UPDATE_SECS 3600

# Language and Locale
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Editor and Pager
set -x EDITOR nano
set -x VISUAL code
set -x PAGER "less -X"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Disable annoying greeting message
set fish_greeting ""

# Tealdeer Config Directory
set -x TEALDEER_CONFIG_DIR "$HOME/.config/tealdeer"

# npm - https://github.com/npm
if type -q npm
    set -x NPM_GLOBAL $HOME/.npm-global
    set -x PATH $NPM_GLOBAL/bin $PATH
end

# pnpm - https://github.com/pnpm/pnpm
if type -q pnpm
    set -x PNPM_HOME $HOME/.pnpm-global
    set -x PATH $PNPM_HOME $PATH
end

# Android Studio SDK - https://developer.android.com/tools
if test -d $HOME/Library/Android/sdk
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    set -x PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
end

# Go - https://github.com/golang/go
if type -q go
    set -x GOPATH "$HOME/go"
    set -x GOROOT (brew --prefix golang)/libexec
    set -x PATH $PATH $GOROOT/bin $GOPATH/bin
end

# Ruby - https://github.com/ruby/ruby
if type -q ruby
    set RUBY_PATH (brew --prefix ruby)/bin
    set -x PATH $RUBY_PATH $PATH

    # Ensure gems are available
    set -x GEM_HOME $HOME/.gems
    set -x PATH $GEM_HOME/bin $PATH
end

# Rust - https://github.com/rust-lang/rustup
if test -d $HOME/.cargo
    source "$HOME/.cargo/env.fish"
end

# jenv - https://github.com/jenv/jenv
if type -q jenv
    set -Ux JENV_ROOT $HOME/.jenv
    set -U fish_user_paths $JENV_ROOT/shims $fish_user_paths
    status --is-interactive; and jenv init - | source
end

# Pyenv - https://github.com/pyenv/pyenv
if type -q pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    status --is-interactive; and pyenv init --path | source
    status --is-interactive; and pyenv init - | source
    status --is-interactive; and pyenv virtualenv-init - | source
end

# The Fuck - https://github.com/nvbn/thefuck
if type -q thefuck
    thefuck --alias | source
end

# Atuin - https://github.com/atuinsh/atuin
if type -q atuin
    atuin init fish --disable-up-arrow | source
end

# fzf - https://github.com/junegunn/fzf
if type -q fzf
    set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
    set -Ux FZF_DEFAULT_OPTS "\
        --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
        --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
        --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
        --color=selected-bg:#494d64 \
        --multi"
    fzf --fish | source
end

# zoxide - https://github.com/ajeetdsouza/zoxide
if type -q zoxide
    zoxide init fish | source
end

# Starship - https://github.com/starship/starship
if type -q starship
    starship init fish | source
end
