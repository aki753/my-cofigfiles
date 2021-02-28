# If you need to have icu4c first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"' >> ~/.zshrc
#   echo 'export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"' >> ~/.zshrc
# 
# For compilers to find icu4c you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/icu4c/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/icu4c/include"

ZSH_EXTEND_FILE=~/.zshExtendFile
ALIAS_FILE=$ZSH_EXTEND_FILE/aliases.zsh

# aliasの設定ファイルを読み込む
if [ -f $ALIAS_FILE ]; then
	source $ALIAS_FILE
else
	print '404: $ALIAS_FILE not found'
fi

# zplug install
# curl -sL --proto-redir -all、https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
source ~/.zplug/init.zsh
zplug "b4b4r07/enhancd", use:init.sh
source ~/.zplug/repos/b4b4r07/enhancd/init.sh

# 色を使用出来るようにする
autoload -Uz colors
colors

source $HOME/.cargo/env

export PS1='%u %# %t %w %$ '

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

# コマンドのスペルを訂正
setopt correct

# FPATHに`~/.zsh/completion`を追加
fpath=(~/.zsh/completion $fpath)

# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit -i

zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完時にヒストリを自動的に展開
setopt hist_expand

##################################################################

##################################################################
# zshのキーバインドをvimにする
bindkey -v
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-keymap-select

# vimのキーバインドでインサートから抜けるためにjjを使う
bindkey -M viins 'jj' vi-cmd-mode
##################################################################

# そのコマンドの履歴をpとnで表示する
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

export PATH=$PATH:~/.npm-global/bin

tmux a
export PATH="/usr/local/Cellar/node/13.5.0/bin/:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
