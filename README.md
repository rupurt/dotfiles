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

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.bash_profile.local`
* `~/.gitconfig.local`
* `~/.gvimrc.local`
* `~/.vimrc.local`
* `~/.vimrc.bundles.local`

## Credits

Heavy influence from [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles)

# Vim Command CheatSheet

## Rails
```
,p = promote assignment to let
,S = run nearest test in current file
,A = run all tests in current file
```

## Discovery
```
,f = fuzzy file find (via CTRL-P)
,b = fuzzy open buffer find (via CTRL-P)
:Ag <search_term> = project pattern search (use Ag, install via brew)
,a = call Ag using the current work under the cursor (or visually selected)
```

## General
```
<space> = clear search higlighting
,v = veritical split
,h = horizontal split
,o = close all other windows in tab, except current
,s = start search command
,n = rename file
[<space> = addline above
]<space> = addline below
,n = autocompelte
<tab> = autocomplete (except when prefixed with whitespace)
<tab> = <tab> (only when prefixed with whitespace)
```

```
,rv = reload vimrc
,e = open edit command with current path filled in
,te = open tab edit command with current path filled in
<ctrl>-n = next buffer
<ctrl>-p = previous buffer
```

### Visual mode specific
```
<tab> = add indent level
<shift><tab> = remove indent level
```

### MacVim only
```
<shift><command>c = copy current file path to clipboard
,C = copy current file + line number path to clipboard
<shift><command><down> = open next quickfix file listing (ie search result)
<shift><command><up> = open previous quickfix file listing (ie search result)
```

## Plugins

### Fugative
```
,g = git blame
```

### Nerd Tree
```
\ = toggle tree
<shift>\ = toggle tree and focus on current file
```

### Commentary
```
,/ = toggle comment
```

### CTRL-P
*also see Discovery*
```
,F = fuzzy file find after resetign cache
<f5> = while in fuzzy finder, refresh cache
```

### regreplop
```
<ctrl>k = paste over, keep original buffer
```

### Splitjoin
```
ss = split a one liner into multiple lines
sj = join multiple lines into a one liner
```

### Vim Rspec
*MacVIM only*
```
<command>r = run current spec + line in iTerm (last tab)
<command>R = run current spec file in iTerm (last tab)
```

### ctags
*requires ctags installed*
*recommend use of gem-ctags for ruby*
```
<ctrl>] = find first tag match
<ctrl>\ = find next tag match
,rt = regenerate tags file
```
