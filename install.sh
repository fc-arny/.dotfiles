#!/usr/bin/env bash

set -euo pipefail

root="${HOME}"/.dotfiles
packages=( "tmux" "git" "zsh")

# add zsh as a login shell
# command -v zsh | sudo tee -a /etc/shells

check() {
  if ! command -v git >/dev/null; then
    echo Install git first
    return 1
  fi

  if ! command -v curl >/dev/null; then
    echo Install cURL first
    return 1
  fi

  return 0
}

check-mac() {
  if [[ ! "$(uname)" =~ Darwin ]]; then 
    return 0; 
  else
    return 1; 
  fi
}

# install-apps() {
#   return 0
#   # if [[ ! "$(uname)" =~ Darwin ]]; then return 0; fi

#   # pushd "${root}" || return 1
#   # echo Installing apps...
#   # toolset/Apps install
#   # popd
#   # return $?
# }

install-clt() {
  if check-mac; then return 0; fi

  if command -v xcode-select >/dev/null; then return 0; fi
  echo Installing Command Line Tools for Xcode...
  xcode-select --install
  return $?
}

install-dotfiles() {
  if [ -d "${root}" ]; then return 0; fi

  echo Installing dotfiles...
  mkdir -p "${root}"
  git clone git@github.com:fc-arny/.dotfiles.git "${root}"
  return $?
}

install-homebrew() {
  if check-mac; then return 0; fi

  if command -v brew >/dev/null; then return 0; fi

  echo Installing Homebrew... # https://docs.brew.sh/Installation
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  local bin
  if [ -x '/usr/local/bin/brew' ]; then bin='/usr/local/bin/brew'; fi
  if [ -x '/opt/homebrew/bin/brew' ]; then bin='/opt/homebrew/bin/brew'; fi
  if [ -x '/home/linuxbrew/.linuxbrew/bin/brew' ]; then bin='/home/linuxbrew/.linuxbrew/bin/brew'; fi
  if [ -z "${bin}" ]; then
    echo Homebrew not found after installation
    return 1
  fi
  eval "$(${bin} shellenv)"
  chmod -R go-w "$(brew --prefix)/share/zsh"
  return $?
}

install-bundle() {
  if check-mac; then return 0; fi

  echo Installing Homebrew bundle...
  brew tap --repair
  brew update --force --quiet
  brew bundle --file="${root}"/mac/Brewfile --no-upgrade -v
  brew bundle --file="${root}"/mac/Brewfile cleanup -v
  return $?
}

# install-tools() {
#   pushd "${root}" || return 1
#   echo Installing tools...
#   make install
#   popd
#   return $?
# }

integrate-cli() {
  for package in "${packages[@]}"; do
    stow -t "$HOME" "$package"
    if [ $? -eq 0 ]; then
      echo "Package $package successfully installed"
    else
      echo "Error while installing package $package."
    fi
  done

  if command -v zsh >/dev/null; then
    if [ ! -d "${HOME}/.oh-my-zsh" ]; then
      echo Installing Oh My Zsh...
      bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
  fi

  return 0
}

if ! check; then return 0; fi

install-clt
install-dotfiles
install-homebrew
install-bundle

# install-tools
# install-apps
integrate-cli