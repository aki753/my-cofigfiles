EDITOR='nvim'

# some more ls aliases
alias ll='ls -alFG'
alias la='ls -AGF'
alias l='ls -CFG'

# git aliases
alias gta='git add'

# git commit
alias gc='git commit'
alias gcm='git commit -m'
alias gce='git commit -e'

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
alias cnv='nvim -u NONE'

alias c='clear'
alias e='exit'

# 必要であれば親ディレクトリも作成するようにする
alias mkdir='mkdir -p'

# 設定ファイルをすぐ編集できるようにする
alias bashrc='$EDITOR ~/.bashrc'
alias sbashrc='source ~/.bashrc'

alias zshrc='$EDITOR ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias aszshrc='unalias -a && source ~/.zshrc'

alias nvimrc='$EDITOR ~/.config/nvim/init.vim'
alias snvimrc='source ~/.config/nvim/init.vim'

alias tmuxrc='$EDITOR ~/.tmux.conf'
alias stmuxrc='tmux source ~/.tmux.conf'

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

# docker-compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dspv='docker system prune --volumes'

alias dsql='mycli -u develop -h localhost -ppassword -D develop '

alias t="tmux"

alias routineTask="~/routineTask.sh"
alias pkgUpdate="~/pkg-update.sh"
alias openApp="~/openApp.sh"

alias yi="yarn install"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yga="yarn global add"
alias yr="yarn run"
alias yre="yarn run example"
alias ys="yarn start"
alias yis="yarn install && yarn start"
alias yt="yarn test"
alias yit="yarn install && yarn test"
alias yl="yarn link"
alias yu="yarn unlink"

alias ysd="yarn start:dev"
alias yd="yarn dev"
alias ymr="yarn migration:run"
alias ysr="yarn seed:run"
