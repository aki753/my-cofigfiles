function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

function show_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function show_prompt () {
  PROMPT=" 
%{${fg[green]}%}[%n@%m]%{${reset_color}%} $(show_git_branch) %~
> "
}
