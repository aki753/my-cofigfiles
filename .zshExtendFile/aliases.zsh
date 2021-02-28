EDITOR='nvim'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gta='git add -A'
alias gtc='git commit'
alias gtp='git push'
alias gtb='git branch'
alias gtch='git checkout'
alias gtl='git log'
alias gtd='git diff'
alias gs='git status'
alias gtpl='git pull'
alias gtcl='git clone'
alias gtf='git fetch'
alias gtm='git merge'
alias gtr='git reset'
alias gtbdm='gtf --prune && gtb --merged | egrep -v "\*|develop|master"|xargs git branch -d'

alias nv='nvim'
alias c='clear'
alias e='exit'

# 必要であれば親ディレクトリも作成するようにする
alias mkdir='mkdir -p'

# 設定ファイルをすぐ編集できるようにする
alias zshrc='$EDITOR ~/.zshrc'
alias nvimrc='$EDITOR ~/.config/nvim/init.vim'
alias tmuxrc='$EDITOR ~/.tmux.conf'

# cd aliases
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# cp mv のさいに途中経過を表示する
alias cp='cp -iv'
alias mv='mv -iv'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
