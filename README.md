# dotfiles

Configuration files for bash, vim, git, ruby, and more.

## Installation

Clone repo:
```sh
git clone git@github.com:attack/dotfiles.git
```

### using brew + rcm (preferred)

Install [rcm](https://github.com/thoughtbot/rcm)
```sh
brew bundle dotfiles/Brewfile
```

Install dotfiles:
```sh
rcup -d dotfiles -x README.md -x install -x Brewfile -x LICENSE
```

### using install script

Run install:
```sh
bash dotfiles/install
```

## Updating

Update Repo:
```sh
cd <your-dotfile-location>
git pull
```

Then just re-run the install steps, as they update as well.

## Make your own cuctomizations

Put your project sharable customizations in dotfiles appended with `.shared`:

* `~/.aliases.shared`

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.bash_profile.local`
* `~/.gitconfig.local`

## Credits

Heavy influence from [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)
