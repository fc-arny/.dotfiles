# 🟣 Dotfiles

My dotfiles for productive work.

## 📋 Requirements
Ensure you have the following installed on your system
- [homebrew](https://brew.sh/)
- [git](https://git-scm.com/) 
- [stow](https://www.gnu.org/software/stow/) 

## 🖥️ Environment

- [brew.sh](https://brew.sh)
- [docker](https://www.docker.com)
- [vim](https://www.vim.org)
- [zsh](https://www.zsh.org)

## 🛠️ Installation
1) Install all necessary dependencies

```bash
$ curl -sSfL https://raw.githubusercontent.com/fc-arny/.dotfiles/master/install | bash
```

2) Check out the dotfiles repo in you $HOME directory using git

```bash
$ git clone git@github.com:fc-arny/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

3) then use GNU stow to create symlinks

```bash
$ stow .
```

When you have it, just use `$ self-update` to sync it with the remote.

## ✨ Articles
Insipried by @dreamsofautonomy.
- [Быстрый старт с Zsh и Powerlevel10k: двигаемся к терминалу мечты](https://habr.com/ru/articles/739376/)
- [Stow has forever changed the way I manage my dotfiles](https://www.youtube.com/watch?v=y6XCebnB9gs)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/index.html).
- [Managing commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification).

## Development
1) Add new folder for package
2) Update package variable at ./install.sh file adding new package

## 📋 TODO
- Research https://www.youtube.com/watch?v=Z8BL8mdzWHI
- Research https://github.com/sobolevn/dotfiles/tree/master 
