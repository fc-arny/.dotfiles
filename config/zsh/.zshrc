export DOT=$HOME/.dotfiles
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=robbyrussell

zstyle ':omz:update' mode disabled

DISABLE_UNTRACKED_FILES_DIRTY=true

# la $ZSH/plugins/
plugins=(
  common-aliases
  docker
  docker-compose
  git
  golang
  kubectl
)

# https://github.com/zsh-users/zsh-completions#oh-my-zsh
if command -v brew >/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
fi

source $ZSH/oh-my-zsh.sh

for script in "${DOT}"/bin/lib/*.bash; do
  source "${script}"
done

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion