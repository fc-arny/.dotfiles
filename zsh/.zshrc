# Reference: https://github.com/denysdovhan/dotfiles/blob/master/home/.zshrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
if [ -f ~/.aliases.zsh ]; then
    source ~/.aliases.zsh
fi

# Environment 
export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# PATH 
_extend_path() { # Extend $PATH without duplicates
  [[ -d "$1" ]] || return

  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    export PATH="$1:$PATH"
  fi
}

_extend_path "/usr/local/bin"
_extend_path "$HOME/.local/bin"
_extend_path "$HOME/bin"
_extend_path "$HOME/.nvm/bin"
_extend_path "$HOME/go/bin"
_extend_path "$DOTFILES/bin"


# PLUGINS via antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh 

# Settings
zstyle ':omz:update' mode disabled

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# https://github.com/zsh-users/zsh-completions#oh-my-zsh
if command -v brew >/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
fi

DISABLE_UNTRACKED_FILES_DIRTY=true

# DIRCOLORS (MacOS)
export CLICOLOR=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

export BAT_THEME="gruvbox-dark"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# 
for script in "${DOTFILES}"/bin/lib/*.bash; do
  source "${script}"
done