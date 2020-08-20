# dotfiles
> fish, vim, pyenv, vscode, macOS defaults and brew bundle, etc.

## Installation

### Dependencies

These need to be installed, first. See [new macOS setup here](macos/README.md).

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `fish`: the shell

### Install

```console
$ curl -sfL https://get.oh-my.fish | fish
$ git clone https://github.com/adamelmore/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap.fish
```

> All modified files will be backed up with a `.backup` suffix.

#### Update

To update, you just need to `git pull` and run the bootstrap script again:

```console
$ cd ~/.dotfiles
$ git pull origin main
$ ./script/bootstrap.fish
```

### macOS defaults

Set up macOS defaults with:

```console
$DOTFILES/macos/set-defaults.sh
```

> Will require a system restart.

### Themes and fonts being used

Theme is **[Dracula](https://draculatheme.com)**, font is **JetBrains Mono** on
editors and **Hack** on terminals.
