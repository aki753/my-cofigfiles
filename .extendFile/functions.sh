function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

function show_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

function show_prompt () {
  PROMPT=" 
%{${fg[green]}%}[%n@%m]%{${reset_color}%}$(show_git_branch) %~
> "
}

function load_setting_file () {
  # $1 is setting file path
  if [ -f $1 ]; then
    source $1
    echo 'already load '$1
  else
    print '404: $1 not found'
  fi
}

