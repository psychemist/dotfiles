# Aliases for built-in commands
alias cl='clear'
alias diffy='diff -y --color=always'
alias ll='ls -l'
alias la='ls -a'
alias lh='ls -lh'
alias lla='ls -la'
alias md='mkdir'
alias rmi='rm -i'
alias sz='du -sh * ; echo "" && du -sh .'
alias today='date +"%A, %B %-d, %Y"'

# Aliases for git bash
alias add='git add'
alias blame='git blame'
alias bra='git branch'
alias chow='git checkout'
alias clone='git clone'
alias com='git commit'
alias coms='git commit -S'
alias comma='git add . && git commit'
alias config='git config'
alias dif='git diff'
alias fet='git fetch'
alias gconf='/usr/bin/git --git-dir=/Users/chukwudike/.cfg/ --work-tree=/Users/chukwudike'
alias glog='git log'
alias meg='git merge'
alias prco='git prco'
alias pull='git pull'
alias push='git push'
alias reb='git rebase'
alias ref='git reflog'
alias rem='git remote'
alias res='git restore'
alias rev='git revert'
alias rex='git reset'
alias s='git status'
alias stash='git stash'
alias sw='git switch'
alias tag='git tag'
alias up='git pull upstream master && git push origin master'

# Bitcoin commands
alias bd="bitcoind"
alias bpwd='bitcoind -conf="$PWD/conf/bitcoin.conf" -allowignoredconf=1 -daemon'

alias bl="bitcoin-cli"
alias br="bitcoin-cli -regtest"
alias bs="bitcoin-cli -signet"
alias bt="bitcoin-cli -testnet4"

alias bcstart="bitcoind -daemon"
alias brstart="bitcoind -regtest -daemon"
alias bsstart="bitcoind -signet -daemon"
alias btstart="bitcoind -testnet4 -daemon"

alias bcstop="bitcoin-cli stop"
alias brstop="bitcoin-cli -regtest stop"
alias bsstop="bitcoin-cli -signet stop"
alias btstop="bitcoin-cli -testnet4 stop"

alias bcdir="cd ~/Library/Application\ Support/Bitcoin/"
alias brdir="cd ~/Library/Application\ Support/Bitcoin/regtest/"
alias bsdir="cd ~/Library/Application\ Support/Bitcoin/signet/"
alias btdir="cd ~/Library/Application\ Support/Bitcoin/testnet4/"

alias btcunspent="bitcoin-cli listunspent | jq -r '.[] | { txid: .txid, vout: .vout, amount: .amount }'"
alias btcinfo='bitcoin-cli getwalletinfo | egrep "\"balance\""; bitcoin-cli getnetworkinfo | egrep "\"version\"|connections"; bitcoin-cli getmininginfo | egrep "\"blocks\"|errors"'

# Aliases for starting shells
alias py3='python3'

# Custom commands
alias gotoc='cd ~/dev/c/textbooks/C-programming_language'
alias npxh='npx hardhat'
alias npr='npm run'
alias nv='nvim'
alias surf='windsurf'
alias theme='echo $RANDOM_THEME'
