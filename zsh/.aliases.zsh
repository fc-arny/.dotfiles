alias update-antidote='antidote bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh'
# List out all globally installed npm packages
alias list-npm-globals='npm list -g --depth=0'
# Adds better handling for `rm` using trash-cli
# https://github.com/sindresorhus/trash-cli
# You can empty the trash using the empty-trash command
# https://github.com/sindresorhus/empty-trash-cli
alias rm='trash'
# use neovim instead of vim
alias vim='nvim'
# checkout branch using fzf
alias gcob='git branch | fzf | xargs git checkout'
# open vim config from anywhere
alias vimrc='vim ${HOME}/.config/nvim/init.vim'
# cat -> bat
alias cat='bat'
# colored ls output
alias ls='ls -al --color'
# jless for yaml files
alias yless="jless --yaml"

# Crypto
alias md5='openssl md5'
alias sha1='openssl sha1'
alias sha256='openssl sha256'
alias sha512='openssl sha512'

# Navi
alias ..='cd ../'
alias ...='cd ../../'
alias dotfiles='cd ~/.dotfiles'

alias cwd='pwd | tr -d "\n" | pbcopy'
alias dots='ls .*'

if ! command -v code >/dev/null && [ -d '/Applications/Visual Studio Code.app' ]; then
  alias code='open -a "Visual Studio Code"'
fi