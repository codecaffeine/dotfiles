# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -lFh --color"
  alias la="gls -lAFh --color"
else
  alias ls="ls -lFh"
  alias la="ls -lAFh"
fi

alias h='history | grep'
