if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting "Hi Leo :)"

set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib -L/Users/nerone/.idris2/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

# opam configuration
source /Users/nerone/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/nerone/.ghcup/bin # ghcup-env

# pnpm
set -gx PNPM_HOME "/Users/nerone/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval /Users/nerone/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

