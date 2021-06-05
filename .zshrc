EXTEND_FILE=~/.extendFile
ALIASES_FILE=$EXTEND_FILE/aliases.sh
EXPORTS_FILE=$EXTEND_FILE/exports.sh
SETOPTS_FILE=$EXTEND_FILE/setopts.zsh
FUNCTIONS_FILE=$EXTEND_FILE/functions.sh

load_setting_file $ALIASES_FILE
load_setting_file $EXPORTS_FILE
load_setting_file $SETOPTS_FILE
load_setting_file $FUNCTIONS_FILE

# zplug install
# curl -sL --proto-redir -all、https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
source ~/.zplug/init.zsh
zplug "b4b4r07/enhancd", use:init.sh
source ~/.zplug/repos/b4b4r07/enhancd/init.sh

autoload -Uz show_prompt
# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit -i
# 色を使用出来るようにする
autoload -Uz colors
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

source $HOME/.cargo/env

# FPATHに`~/.zsh/completion`を追加
fpath=(~/.zsh/completion $fpath)

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

##################################################################
zle -N zle-line-init
zle -N zle-keymap-select

# vimのキーバインドでインサートから抜けるためにjjを使う
bindkey -M viins 'jj' vi-cmd-mode
##################################################################

# そのコマンドの履歴をpとnで表示する
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

eval "$(pyenv init -)"

# Nerd fort Linux
# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

add-zsh-hook precmd show_prompt
