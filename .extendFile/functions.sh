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

# deci2hexa 255
# FF
function dec2hex(){
  printf "%X" $1
}

# color code dec2hex
function cdec2hex(){
  echo $(dec2hex $1)$(dec2hex $2)$(dec2hex $3)
}

# hexa2deci FF
# 255
function hex2dec(){
  hex_prefix=0x
  printf "%d" $hex_prefix$1
}

# color code hex2dec
function chex2dec(){
  echo $(hex2dec $1) $(hex2dec $2) $(hex2dec $3)
}
