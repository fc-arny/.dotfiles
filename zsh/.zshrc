# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
export PATH=${PATH}:/usr/local/go/bin
export PATH=${PATH}:${HOME}/go/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# bundle zsh plugins 
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

ZSH_THEME=robbyrussell

# Bundle zsh plugins via antidote
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

# DIRCOLORS (MacOS)
export CLICOLOR=1

# FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --margin=1 --padding=1"

export BAT_THEME="gruvbox-dark"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# for script in "${DOT}"/bin/lib/*.bash; do
#   source "${script}"
# done

# # Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# # Set name of the theme to load --- if set to "random", it will
# # load a random theme each time oh-my-zsh is loaded, in which case,
# # to know which specific one was loaded, run: echo $RANDOM_THEME
# # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

