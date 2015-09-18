# my .*rc files

## install

### git clone
```
$ cd ~
$ git clone git@github.com:omiend/.dotfiles.git
```

### enable bashrc
```
$ ln -s ~/.dotfiles/.bashrc ~/.bashrc
$ source ~/.bashrc
```

### enable vimrc
```
$ ln -s ~/.dotfiles/.vimrc ~/.vimrc
$ source ~/.vimrc
```

### SublimeText 3
```
$ ln -s ~/.dotfiles/sublimetext3_Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
```

### Atom
Export My Atom Packages
```
$ apm ls -bi | awk -F@ '{print $1}' > ~/dotfiles/atom_packages
```

Install My Atom Packages
```
$ apm install --packages-file ~/dotfiles/atom_packages
```
