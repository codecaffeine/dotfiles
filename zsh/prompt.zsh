autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

# A lot of this comes from http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' disable bzr cdv cvs darcs mtn p4 svk tla
# zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%b%f'

git_prompt_info () {
 echo "${vcs_info_msg_0_}"
}

git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit (working directory clean)" ]]
    then
      echo "$(git_prompt_info)"
    else
      echo "%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

unpushed () {
  /usr/bin/git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo "/%{$fg[magenta]%}unpushed%{$reset_color%}"
  fi
}


git_prompt(){
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
		echo "($(git_dirty)$(need_push))"
	fi
}

directory_name(){
  echo "%n@%m %{$fg[cyan]%}%c%{$reset_color%}"
}

export PROMPT=$'[$(directory_name)$(git_prompt)]$ '

precmd() {
  vcs_info
}
