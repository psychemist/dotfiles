typeset -U path fpath

path=("${(@)path:#/usr/local/bin/python3}")
fpath=("${(@)fpath:#$HOME/.twilio-cli/autocomplete/functions/zsh}")

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

HISTFILE=${HISTFILE:-$HOME/.zsh_history}
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

export NARGO_HOME="$HOME/.nargo"
path=(
  "$HOME/.opencode/bin"
  "$HOME/.local/bin"
  "$HOME/.antigravity-ide/antigravity-ide/bin"
  "$HOME/.antigravity/antigravity/bin"
  "${GOPATH:-$HOME/go}/bin"
  "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
  /usr/local/opt/postgresql@16/bin
  /usr/local/bin
  $path
  "$HOME/.aztec/bin"
  "$NARGO_HOME/bin"
)
export PATH

for _completion_dir in \
  /usr/local/share/zsh/site-functions \
  "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"; do
  [[ -d $_completion_dir ]] && fpath=("$_completion_dir" $fpath)
done
unset _completion_dir
autoload -Uz compinit
compinit -d "${ZSH_COMPDUMP:-$HOME/.zcompdump}"
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} m:{-_}={_-}'
for _keymap in emacs viins; do
  bindkey -M "$_keymap" '^I' expand-or-complete
  bindkey -M "$_keymap" '^[[C' forward-char
  bindkey -M "$_keymap" '^[OC' forward-char
done
unset _keymap

export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  _nvm_default=''
  if [[ -n $NVM_BIN && -x "$NVM_BIN/node" ]]; then
    path=("$NVM_BIN" $path)
  else
    [[ -r "$NVM_DIR/alias/default" ]] && IFS= read -r _nvm_default < "$NVM_DIR/alias/default"
    if [[ -n $_nvm_default && -x "$NVM_DIR/versions/node/$_nvm_default/bin/node" ]]; then
      export NVM_BIN="$NVM_DIR/versions/node/$_nvm_default/bin"
      export NVM_INC="$NVM_DIR/versions/node/$_nvm_default/include/node"
      path=("$NVM_BIN" $path)
    fi
  fi
  unset _nvm_default

  function nvm() {
    unfunction nvm
    source "$NVM_DIR/nvm.sh" --no-use || return
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
    nvm "$@"
  }
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && path=("$PYENV_ROOT/bin" $path)
[[ -d "$PYENV_ROOT/shims" ]] && path=("$PYENV_ROOT/shims" $path)
if (( $+commands[pyenv] )); then
  function pyenv() {
    local init_code
    init_code=$(command pyenv init - --no-rehash zsh) || return
    unfunction pyenv
    eval "$init_code"
    pyenv "$@"
  }
fi
[[ -t 0 ]] && export GPG_TTY=$(tty)

[[ -r "$HOME/.zsh-custom/aliases.zsh" ]] && source "$HOME/.zsh-custom/aliases.zsh"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
[[ -r "$HOME/.zsh-custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$HOME/.zsh-custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

[[ -r "$HOME/.zsh-custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$HOME/.zsh-custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
