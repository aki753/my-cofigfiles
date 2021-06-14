# Ctrl + k : autosuggest-executeを実行。コマンドを打つと薄い文字でコマンドが出てくるため、それを実行する。
# gitのブランチは自前で実装。これは今の所zshだけ使える。

EXTEND_FILE=~/.extendFile
ALIASES_FILE=$EXTEND_FILE/aliases.sh
EXPORTS_FILE=$EXTEND_FILE/exports.sh
SETOPTS_FILE=$EXTEND_FILE/setopts.zsh
FUNCTIONS_FILE=$EXTEND_FILE/functions.sh

function load_setting_file () {
  # $1 is setting file path
  if [ -f $1 ]; then
    source $1
    echo 'already load '$1
  else
    print '$1 not found'
  fi
}

load_setting_file $ALIASES_FILE
load_setting_file $EXPORTS_FILE
load_setting_file $SETOPTS_FILE
load_setting_file $FUNCTIONS_FILE

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

source ~/.zplug/init.zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
source ~/.zplug/repos/b4b4r07/enhancd/init.sh

if ! zplug check --verbose; then
    printf "zplug Install? [y/N]: "
    if read -q; then
        curl -sL --proto-redir -all、https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
        echo zplug installed
    fi
fi

# プロンプト表示と、プロンプトにブランチ名を表示するようにする
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

# FPATHに`~/.zsh/completion`を追加
fpath=(~/.zsh/completion $fpath)

##################################################################
zle -N zle-line-init
zle -N zle-keymap-select

# vimのキーバインドでインサートから抜けるためにjjを使う
bindkey -M viins 'jj' vi-cmd-mode
##################################################################

# そのコマンドの履歴をpとnで表示する
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

# zsh-autosuggestionsのインストール or 読み込み
case $(uname) in
  'Linux' )
    ZSH_AUTOSUGGESTIONS_PATH=~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    if [ -f $ZSH_AUTOSUGGESTIONS_PATH ]; then
      source $ZSH_AUTOSUGGESTIONS_PATH
    else
      git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
      source $ZSH_AUTOSUGGESTIONS_PATH
    fi;;
  'Darwin' )
    ZSH_AUTOSUGGESTIONS_PATH=/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    if [ -f $ZSH_AUTOSUGGESTIONS_PATH ]; then
      source $ZSH_AUTOSUGGESTIONS_PATH
    else
      # 所有しているMacがロゼッタで開いているため、arch -arm64
      # をつける。ロゼッタで開いていない場合はいらない。
      arch -arm64 brew install zsh-autosuggestions
      source $ZSH_AUTOSUGGESTIONS_PATH
    fi;;
esac

# zsh-autosuggestions settings
# C-kで出てきた候補を実行する 
bindkey '^k' autosuggest-execute

# Nerd fort Linux
# mkdir -p ~/.local/share/fonts
# cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

add-zsh-hook precmd show_prompt
