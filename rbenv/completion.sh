# Uses rbenv's autocompletion for inner commands
completion=$HOME/.rbenv/completions/rbenv.zsh

if test -f $completion
then
  source $completion
fi
