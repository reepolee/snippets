### Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

plugins=(git)

### Environment / Locale
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
else
   export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

### PATH & Tool Environments
export VOLTA_HOME=$HOME/.volta
export PATH=$HOME/scripts:$VOLTA_HOME/bin:$PATH
unset _VOLTA_TOOL_RECURSION

# pnpm
export PNPM_HOME="/Users/ales/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
export PATH="$PATH:/Users/ales/zig/bin"

# Created by `pipx` on 2026-01-10 18:08:40
export PATH="$PATH:/Users/ales/.local/bin"

# bun completions
[ -s "/Users/ales/.bun/_bun" ] && source "/Users/ales/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

### Prompt
eval "$(oh-my-posh init zsh  --config ~/scripts/ales.omp.json)"

### Aliases
# For a full list of active aliases, run `alias`.
alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias ll="ls -lah"
alias p="pnpm"
alias cls='printf "\033c"'
alias rmnm='rm -rf ./node_modules'
alias bp='pnpm build && pnpm preview'
alias brewls="brew deps --tree --installed"
alias buc="bun upgrade --canary"
alias f="freebuff"

### Zellij session auto-attach
if command -v zellij >/dev/null 2>&1 && [ -z "$ZELLIJ" ]; then
    _last_zellij_session="$(zellij ls -s -r 2>/dev/null | head -n1)"
    [ -n "$_last_zellij_session" ] && zellij attach "$_last_zellij_session"
    unset _last_zellij_session
fi

### Startup
cd ~/code
