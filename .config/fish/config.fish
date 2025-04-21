set -g theme_color_scheme dracula

set -x EDITOR "nvim"
set -x TERM screen-256color-bce

set -gx GPG_TTY (tty)

set -x HOMEBREW_NO_ENV_HINTS 1

set -x JAVA_HOME "/opt/homebrew/opt/openjdk/"

set -x LDFLAGS "$LDFLAGS -I/opt/homebrew/include -L/opt/homebrew/lib"
set -x CFLAGS "$CFALGS -I/opt/homebrew/include -L/opt/homebrew/lib"
set -x CXXFLAGS "$CXXFLAGS -I/opt/homebrew/include -L/opt/homebrew/lib"
set -x CPATH "/opt/homebrew/include"
set -x LIBRARY_PATH "/opt/homebrew/lib"

set -x NVM_DIR "$HOME/.nvm"
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

abbr --add tm "tmux -CC at -t"

abbr --add vn "sudo brew services start sing-box"
abbr --add vf "sudo brew services stop sing-box"
abbr --add vr "sudo brew services stop sing-box"

alias beep="tput bel"

alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
