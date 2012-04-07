# my dotfiles

These are my dotfiles. There are many like it, but these are mine.

## dotfiles

Forked from [Zach Holman's dotfiles](http://github.com/holman/dotfiles). His [README](https://github.com/holman/dotfiles#readme) explains how to use this repo and his [blog post](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) explains the philosophy of dotfiles.

## install

- `git clone git://github.com/holman/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

